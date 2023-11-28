import 'dart:html' as html;

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../export.dart';
import '../schema/player_status.dart';
import '../state/player_state.dart';

enum GameEvent {
  playerStatus,
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

  PublishSubject<PlayerStatus> onPlayerStatusChanged = PublishSubject();

  Future<void> _init() async {
    // if (kDebugMode) return;
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
    }).on(RealtimeListenTypes.broadcast, ChannelFilter(event: GameEvent.playerStatus.name), (payload, [_]) {
      var data = PlayerStatus.fromJson(payload['data']);
      if (data.userId != manager.me.value.id) {
        onPlayerStatusChanged.add(data);
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
    log.i('_onPresenceSync $leaveRef');
    Map<String, List<Presence>> presenceState = _channel.presenceState() as Map<String, List<Presence>>;

    var players = presenceState.values
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
        })
        .whereNotNull()
        .toList();
    log.i(players);

    manager.setPlayers(players);
  }

  Future<void> _onSubscribed() async {}

  Future<ChannelResponse?> trackMe(PlayerState player) {
    return _sendPresence(player.toJson());
  }

  Future<ChannelResponse?> sendStatus({double x = -1, double y = -1, int exp = -1, int hp = -1}) {
    return _sendBroadcast(
      GameEvent.playerStatus,
      PlayerStatus(userId: manager.me.value.id, x: x, y: y, exp: exp, hp: hp).toJson(),
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
