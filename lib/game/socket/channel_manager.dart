import 'dart:html' as html;

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../export.dart';
import '../schema/player_position.dart';
import '../state/player_state.dart';

enum GameEvent {
  playerPosition,
}

enum ChannelState {
  subscribed,
  closed,
  error,
}

class ChannelManager {
  ChannelManager() {
    _init();
  }

  late final RealtimeChannel _channel =
      supabase.channel('game', opts: const RealtimeChannelConfig(ack: true, self: true));
  ChannelState _channelState = ChannelState.closed;

  bool get _isSubscribed => _channelState == ChannelState.subscribed;

  PublishSubject<PlayerPosition> onPlayerPositionChanged = PublishSubject();

  Future<void> _init() async {
    if (kDebugMode) return;
    _subscribeEvents();

    html.window.addEventListener('beforeunload', (e) async {
      await supabase.removeAllChannels();
    });
  }

  void _subscribeEvents() {
    // Sync Player States
    _channel.on(RealtimeListenTypes.presence, ChannelFilter(event: 'sync'), (payload, [ref]) {
      _onPresenceSync();
    }).on(RealtimeListenTypes.presence, ChannelFilter(event: 'leave'), (payload, [ref]) {
      log.i('leave $payload $ref');
      _onPresenceSync(leaveRef: ref);
    }).on(RealtimeListenTypes.broadcast, ChannelFilter(event: GameEvent.playerPosition.name), (payload, [_]) {
      var data = PlayerPosition.fromJson(payload['data']);
      if (data.userId != manager.me.value.id) {
        onPlayerPositionChanged.add(data);
      }
    }).subscribe(
      (status, [error]) {
        switch (status) {
          case 'SUBSCRIBED':
            _channelState = ChannelState.subscribed;
            _onSubscribed();
          case 'CLOSED':
            _channelState = ChannelState.closed;
          default:
            _channelState = ChannelState.error;
        }
      },
      8000.ms,
    );
  }

  void _onPresenceSync({String? leaveRef}) {
    log.i('leave $leaveRef');
    Map<String, List<Presence>> presenceState = _channel.presenceState() as Map<String, List<Presence>>;

    var playerList = presenceState.values
        .where((element) =>
            element.isNotEmpty && (leaveRef != null ? leaveRef != element.first.presenceRef : true))
        .map((presences) => presences.first)
        .map((presence) {
      var payload = presence.payload;
      var player = PlayerState.fromJson(payload['data']);
      if (player.id == manager.me.value.id) {
        return null;
      }
      // apply id with presence ref
      return player;
    }).whereNotNull();
    Map<String, PlayerState> players = {};
    for (var player in playerList) {
      players[player.id] = player;
    }

    manager.channel.players.value = players;
    log.i(players);
  }

  Future<void> _onSubscribed() async {}

  Future<ChannelResponse?> trackMe(PlayerState player) {
    return _sendPresence(player.toJson());
  }

  Future<ChannelResponse?> sendPosition(double x, double y) {
    return _sendBroadcast(
      GameEvent.playerPosition,
      PlayerPosition(userId: manager.me.value.id, x: x, y: y).toJson(),
    );
  }

  Future<ChannelResponse?> _sendPresence(dynamic data) async {
    if (!_isSubscribed) return null;
    return _channel.track({'data': data});
  }

  Future<ChannelResponse?> _sendBroadcast(GameEvent event, dynamic data) async {
    if (!_isSubscribed) return null;
    return _channel.send(
      type: RealtimeListenTypes.broadcast,
      event: event.name,
      payload: {'data': data},
    );
  }
}
