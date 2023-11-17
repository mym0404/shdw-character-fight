import 'package:flame/events.dart';
import 'package:flame/experimental.dart';

import '../../export.dart';
import '../component/item/circle_food.dart';
import '../component/player/player.dart';
import 'world_background.dart';

class GameWorld extends World with GRef {
  GameWorld({
    required this.me,
  });

  double accumulatedTime = 0;
  double foodSpawnInterval = 20;
  int foodCount = 0;

  final Player me;

  @override
  FutureOr<void> onLoad() {
    add(WorldBackground());
    addPlayer(me);
    _setUpCam();
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

    // if (accumulatedTime >= foodSpawnInterval) {
    //   _spawnCircleFood();
    //   accumulatedTime = 0;
    // }
  }

  void _followCameraToPlayer() {
    game.cam.viewfinder.position = me.position - game.size / 2;
  }

  void onMouseMove(PointerHoverInfo info) {
    me.moveWithMousePosition(info);
  }

  void addPlayer(Player player) {
    player.position = V2(Const.worldWidth / 2, Const.worldHeight / 2);
    add(player);
  }

  void _spawnCircleFood() {
    log.i('sapwn');
    for (int i = 0; i < 100 && foodCount < 10000; i++, foodCount++) {
      var spawnX = Const.worldPadding + Random().nextDouble() * (Const.worldWidth - Const.worldPadding * 2);
      var spawnY = Const.worldPadding + Random().nextDouble() * (Const.worldHeight - Const.worldPadding * 2);

      add(CircleFood()..position = V2(spawnX, spawnY));
    }
  }
}
