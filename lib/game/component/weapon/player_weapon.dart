import 'package:flame/collisions.dart';
import 'package:flame/effects.dart';

import '../../../export.dart';
import '../player/player.dart';
import 'weapon_circle.dart';

class PlayerWeapon extends PositionComponent {
  PlayerWeapon({
    required this.isMe,
  });

  List<Weapon> weapons = [];

  int weaponCount = 3;
  int weaponMoveDistance = 100;

  bool isMe;

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    _initWeapons();
    add(
      RotateEffect.by(
        2 * pi,
        InfiniteEffectController(EffectController(duration: 1, curve: Curves.linear)),
      ),
    );
  }

  void _initWeapons() {
    double angle = 0;
    double angleGap = 2 * pi / weaponCount;
    for (int i = 0; i < weaponCount; i++, angle += angleGap) {
      var weapon = WeaponCircle(withCollisionCallbacks: isMe)..anchor = Anchor.center;
      weapon.add(weapon.renderChild);

      weapons.add(weapon);
      add(weapon);

      weapon.add(
        MoveByEffect(
          V2(cos(angle) * weaponMoveDistance, sin(angle) * weaponMoveDistance),
          InfiniteEffectController(SequenceEffectController([
            EffectController(duration: 0.5, curve: Curves.easeIn),
            PauseEffectController(2, progress: 1),
            ReverseCurvedEffectController(0.5, Curves.easeIn),
          ])),
        ),
      );
    }
  }

  void onCollision(PositionComponent other) {
    di<Player>().onCollision(other);
  }
}

abstract interface class Weapon {
  int get damage;
  double get radius;
  PositionComponent get renderChild;
}
