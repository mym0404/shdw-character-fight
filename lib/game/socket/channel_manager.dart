import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../export.dart';
import '../state/player_state.dart';

enum GameEvent {
  playerState,
}

enum ChannelState {
  subscribed,
  closed,
  error,
}

class ChannelManager {
  final userId = const Uuid().v4();
  final RealtimeChannel _channel =
      supabase.channel('game', opts: const RealtimeChannelConfig(ack: true, self: true));
  ChannelState _channelState = ChannelState.closed;

  ChannelManager() {
    _subscribeEvents();
    _subscribeChannel();
  }

  void _subscribeEvents() {
    // Sync Player States
    _channel.on(RealtimeListenTypes.presence, ChannelFilter(event: 'sync'), (payload, [ref]) {
      final presenceState = _channel.presenceState();

      List<PlayerState> players = presenceState.values
          .map((presences) => (presences.first as Presence).payload['player'])
          .map((rawJson) => PlayerState.fromJson(rawJson))
          .toList();

      manager.channel.players = players;
    });

    _channel.on(RealtimeListenTypes.broadcast, ChannelFilter(event: GameEvent.playerState.name), (payload,
        [_]) {
      // Start the game if someone has started a game with you

      var playerState = PlayerState.fromJson(payload['data']);
      log.i(playerState);
    });
  }

  void _subscribeChannel() {
    _channel.subscribe(
      (status, [error]) {
        log.i(status);
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
    );
  }

  Future<void> _onSubscribed() async {
    var res = await _trackMe();
    log.d(res);
  }

  Future<ChannelResponse> _trackMe() {
    return _sendPresence(manager.me.value);
  }

  Future<ChannelResponse> _sendPresence(dynamic data) {
    return _channel.track({'data': data.toJson()});
  }
}
