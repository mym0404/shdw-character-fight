// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../export.dart';
import '../schema/broadcast_dto.dart';
import '../schema/player_dead_dto.dart';
import '../schema/player_status_dto.dart';
import '../state/player_state.dart';

enum GameEvent {
  playerStatus,
  playerDead,
}

enum ChannelState {
  subscribed,
  closed,
  error,
}

class ChannelManager {
  ChannelManager() {
    if (kDebugMode) return;
    _init();
  }

  late final RealtimeChannel _channel =
      supabase.channel('game', opts: const RealtimeChannelConfig(ack: true, self: true));
  ChannelState _channelState = ChannelState.closed;

  bool get _isSubscribed => _channelState == ChannelState.subscribed;

  PublishSubject<PlayerStatusDto> onPlayerStatusChanged = PublishSubject();
  PublishSubject<PlayerDeadDto> onPlayerDead = PublishSubject();

  Future<void> _init() async {
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
      _onPresenceSync(leaveRef: ref);
    }).on(RealtimeListenTypes.broadcast, ChannelFilter(event: 'common'), (payload, [_]) {
      var data = BroadcastDto.fromJson(payload['data']);

      switch (data.event) {
        case GameEvent.playerStatus:
          var payload = PlayerStatusDto.fromJson(data.payload!);
          onPlayerStatusChanged.add(payload);
        case GameEvent.playerDead:
          var payload = PlayerDeadDto.fromJson(data.payload!);
          onPlayerDead.add(payload);
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
    log.i('_onPresenceSync, $players');

    manager.setOtherPlayers(players);
  }

  Future<void> _onSubscribed() async {}

  Future<ChannelResponse?> trackMe(PlayerState player) {
    return _sendPresence(player.toJson());
  }

  Future<ChannelResponse?> sendStatus(
      {String? id, double x = -1, double y = -1, int exp = -1, int hp = -1}) async {
    return _sendBroadcast(
      GameEvent.playerStatus,
      PlayerStatusDto(userId: id ?? manager.me.value.id, x: x, y: y, exp: exp, hp: hp).toJson(),
    );
  }

  Future<ChannelResponse?> sendPlayerDead({required String id}) async {
    log.i(await _sendBroadcast(
      GameEvent.playerDead,
      PlayerDeadDto(id: id).toJson(),
    ));
  }

  Future<ChannelResponse?> _sendPresence(dynamic data) async {
    if (!_isSubscribed) return null;
    return _channel.track({'data': data});
  }

  Future<ChannelResponse?> _sendBroadcast(GameEvent event, Json data) async {
    if (!_isSubscribed) return null;
    return _channel.send(
      type: RealtimeListenTypes.broadcast,
      event: 'common',
      payload: {'data': BroadcastDto(event, data).toJson()},
    );
  }
}
