import 'package:flame/effects.dart';
import 'package:flame/layout.dart';
import 'package:flame_network_assets/flame_network_assets.dart';

import '../../../export.dart';
import '../../state/player_state.dart';
import '../weapon/player_weapon.dart';
import 'player_hud.dart';

class PlayerReadonly extends PositionComponent {
  PlayerReadonly()
      : super(
          size: V2.all(Const.playerSize),
        );

  final _PlayerBackground bg = _PlayerBackground();
  late final PlayerHud hud = PlayerHud();
  Component? thumbnail;

  double lerpRate = 10.0;
  V2 destinationPosition = V2.zero();

  @override
  FutureOr<void> onLoad() {
    _initBackground();
    _initHud();
    _initWeapon();
  }

  Future<void> _initBackground() async {
    add(bg..size = size);
  }

  void _initHud() {
    add(hud);
  }

  void _initWeapon() {
    add(AlignComponent(child: PlayerWeapon(), alignment: Anchor.center)..priority = -10);
  }

  @override
  void update(double dt) {
    if (position.distanceTo(destinationPosition) >= 100) {
      position = destinationPosition;
    } else {
      position.lerp(destinationPosition, lerpRate * dt);
    }

    super.update(dt);
  }

  void updateWithPlayerState(PlayerState state) {
    updateNickname(state.nickname);
    updateThumbnail(state.thumbnail);
  }

  void updatePosition(double x, double y) {
    destinationPosition = V2(x, y);
  }

  void updateBackgroundBorderColor(Color color) {
    bg.borderColor = color;
  }

  void updateNickname(String nickname) {
    hud.nickname = nickname;
  }

  Future<void> updateThumbnail(String thumbnail) async {
    final networkAssets = FlameNetworkImages();
    final playerSprite = await networkAssets.load(thumbnail);

    this.thumbnail?.removeFromParent();

    this.thumbnail = ClipComponent.circle(
      children: [
        SpriteComponent.fromImage(playerSprite)..size = size,
      ],
    )..size = size;

    add(this.thumbnail!);
  }
}

class _PlayerBackground extends CustomPainterComponent {
  _PlayerBackground({
    this.borderColor = C.white,
  });
  Color borderColor;

  @override
  CustomPainter? get painter => _Painter(borderColor: borderColor);
}

class _Painter extends CustomPainter {
  _Painter({
    required this.borderColor,
  });
  Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width, h = size.height;

    var paint = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), paint);
  }

  @override
  bool shouldRepaint(_Painter old) {
    return old.borderColor != borderColor;
  }
}
