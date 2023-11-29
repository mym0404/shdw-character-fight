import 'dart:html';

import 'package:uuid/uuid.dart';

import '../../export.dart';
import '../util/level_manager.dart';
import '../util/user_thumbnail_util.dart';
import 'game_state.dart';
import 'player_state.dart';

class GameManager {
  VAL<GameState> state = VAL(const GameState());
  VAL<PlayerState> me = VAL(
    PlayerState(
      id: const Uuid().v4(),
      exp: 0,
      hp: LevelManager.hpForEachLevel[0],
      thumbnail: di<UserThumbnailUtil>().getRandomThumbnail(),
    ),
  );
  Map<String, VAL<PlayerState>> players = {};
  VAL<Set<String>> playersIds = VAL({});

  void startGame() {
    state.value = state.value.copyWith(isGameStarted: true);
    _listenStreams();
  }

  void _listenStreams() {
    channelManager.onPlayerStatusChanged.listen((value) {
      if (value.userId == manager.me.value.id) {
        manager.me.value = manager.me.value.copyWith(
          exp: value.exp == -1 ? manager.me.value.exp : value.exp,
          hp: value.hp == -1 ? manager.me.value.hp : value.hp,
        );
      } else {
        if (players.containsKey(value.userId)) {
          var prev = players[value.userId]!.value;

          var newState = players[value.userId]!.value.copyWith(
                x: value.x == -1 ? prev.x : value.x,
                y: value.y == -1 ? prev.y : value.y,
                exp: value.exp == -1 ? prev.exp : value.exp,
                hp: value.hp == -1 ? prev.hp : value.hp,
              );
          updateOtherPlayer(newState);
        }
      }
    });

    channelManager.onPlayerDead.listen((value) {
      if (value.id == manager.me.value.id) {
        endGame();
      } else {}
    });
  }

  void endGame() {
    window.location.replace(
      'https://www.shutterstock.com/image-vector/grunge-death-icon-busted-vector-stamp-2148385189',
    );
    // di<MainGame>().overlays.add(OverlayId.ready);
    // state.value = state.value.copyWith(isGameStarted: false);
    // me.value = PlayerState(
    //     id: me.value.id, exp: 0, hp: LevelManager.hpForEachLevel[0], thumbnail: me.value.thumbnail);
  }

  void setMeProfile({required String nickname}) {
    me.value = me.value.copyWith(nickname: nickname);
  }

  void updateExp({required String userId, required int exp}) {
    if (players.containsKey(userId)) {
      players[userId]!.value = players[userId]!.value.copyWith(exp: exp);
    }
  }

  void setOtherPlayers(Iterable<PlayerState> value) {
    for (var p in value) {
      if (players.containsKey(p.id)) {
        players[p.id]!.value = p;
      } else {
        players[p.id] = VAL(p);
      }
    }

    var newIds = value.map((e) => e.id).toSet();

    var removedIds = <String>[];
    for (var MapEntry(:key) in players.entries) {
      if (!newIds.contains(key)) {
        removedIds.add(key);
      }
    }

    for (var removedId in removedIds) {
      players.remove(removedId);
    }

    playersIds.value = newIds;
  }

  void updateOtherPlayer(PlayerState state) {
    if (playersIds.value.contains(state.id)) {
      players[state.id]!.value = state;
    }
  }
}
