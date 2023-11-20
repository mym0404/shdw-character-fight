import 'package:flame/events.dart';
import 'package:flame/experimental.dart';

import '../../export.dart';
import '../component/jewel/jewel_component.dart';
import '../component/jewel/jewel_stone.dart';
import '../component/player/player.dart';
import '../component/player/player_readonly.dart';
import '../state/player_state.dart';
import '../util/DisposeBag.dart';
import 'world_background.dart';

class GameWorld extends World with GRef, DisposeBag {
  double accumulatedTime = 0;

  Player? myPlayer;
  Map<String, PlayerReadonly> otherPlayers = {};

  @override
  FutureOr<void> onLoad() {
    add(WorldBackground());
    _setUpCam();

    listenStream(manager.channel.players, (players) {
      for (var MapEntry(value: player) in players.entries) {
        updateOtherPlayer(player);
      }

      // remove player if doesn't exist
      var removedUserIds = <String>{};
      otherPlayers.forEach((key, value) {
        if (!players.containsKey(key)) {
          removedUserIds.add(key);
        }
      });

      for (var id in removedUserIds) {
        otherPlayers[id]?.removeFromParent();
        otherPlayers.remove(id);
      }
    });
    listenStream(channelManager.onPlayerPositionChanged, (data) {
      if (otherPlayers.containsKey(data.userId)) {
        otherPlayers[data.userId]!.updatePosition(data.x, data.y);
      }
    });
  }

  @override
  void onRemove() {
    if (myPlayer != null) {
      di.unregister(instance: myPlayer!);
    }

    super.onRemove();
  }

  void _setUpCam() {
    var worldRect = Rectangle.fromPoints(V2(0, 0), V2(Const.worldWidth, Const.worldHeight));
    game.cam.setBounds(worldRect);
  }

  @override
  void update(double dt) {
    accumulatedTime += dt;
    super.update(dt);

    _followCameraToPlayer();
  }

  void _followCameraToPlayer() {
    if (myPlayer == null) return;
    game.cam.viewfinder.position = myPlayer!.position - game.size / 2;
  }

  void onMouseMove(PointerHoverInfo info) {
    if (myPlayer == null) return;
    myPlayer?.moveWithMousePosition(info);
  }

  void addMyPlayer() {
    myPlayer = Player(key: ComponentKey.named('player'))
      ..anchor = Anchor.center
      ..x = 100
      ..y = 100;
    di.registerSingleton<Player>(myPlayer!);
    add(myPlayer!);

    // should be removed
    add(JewelComponent(jewel: JewelStone())..position = V2(150, 150));
  }

  void _addOtherPlayer(PlayerState state) {
    var player = PlayerReadonly(isMe: false)
      ..anchor = Anchor.center
      ..updateWithPlayerState(state);
    otherPlayers[state.id] = player;
    add(player);
  }

  void updateOtherPlayer(PlayerState state) {
    if (otherPlayers[state.id] == null) {
      _addOtherPlayer(state);
    } else {
      otherPlayers[state.id]!.updateWithPlayerState(state);
    }
  }
}
