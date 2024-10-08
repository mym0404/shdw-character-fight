import 'package:flame/collisions.dart';
import 'package:flame/layout.dart';
import 'package:flame_network_assets/flame_network_assets.dart';

import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import '../../state/player_state.dart';
import '../weapon/player_weapon.dart';
import 'player_hud.dart';

class PlayerReadonly extends PositionComponent with DisposeBag, CollisionCallbacks {
  PlayerReadonly({
    required PlayerState initialPlayerState,
  })  : isMe = initialPlayerState.id == manager.me.value.id,
        userId = initialPlayerState.id,
        hud = PlayerHud(initialPlayerState: initialPlayerState),
        super(
          size: V2.all(Const.playerSize),
        );

  final _PlayerBackground bg = _PlayerBackground();
  final PlayerHud hud;

  int get exp => isMe ? manager.me.value.exp : manager.players[userId]!.value.exp;
  int get hp => isMe ? manager.me.value.hp : manager.players[userId]!.value.hp;

  bool isMe;
  String userId;
  Component? thumbnail;

  double lerpRate = 50.0;
  V2 destinationPosition = V2.zero();

  @override
  FutureOr<void> onLoad() {
    _initBackground();
    _initHud();
    _initWeapon();

    if (!isMe) {
      listenValue(manager.players[userId]!, updateWithPlayerState);
      add(CircleHitbox()..collisionType = CollisionType.passive);
    }
  }

  void updateWithPlayerState(PlayerState state, {bool updatePosition = true}) {
    _updateNickname(state.nickname);
    _updateThumbnail(state.thumbnail);
    _updateExp(state.exp);
    _updateHp(state.hp);
    if (updatePosition) {
      _updatePosition(state.x, state.y);
    }
  }

  Future<void> _initBackground() async {
    add(bg..size = size);
  }

  void _initHud() {
    add(hud);
  }

  void _initWeapon() {
    add(AlignComponent(child: PlayerWeapon(isMe: isMe), alignment: Anchor.center)..priority = -10);
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

  void _updatePosition(double x, double y) {
    destinationPosition = V2(x, y);
  }

  void _updateExp(int exp) {
    // todo
  }

  void _updateHp(int hp) {
    hud.hp = hp;
  }

  void _updateBackgroundBorderColor(Color color) {
    bg.borderColor = color;
  }

  void _updateNickname(String nickname) {
    hud.nickname = nickname;
  }

  Future<void> _updateThumbnail(String thumbnail) async {
    final networkAssets = FlameNetworkImages();
    final playerSprite = await networkAssets.load(thumbnail);

    this.thumbnail?.removeFromParent();

    this.thumbnail = ClipComponent.circle(
      children: [
        SpriteComponent.fromImage(playerSprite)..size = size,
      ],
    )
      ..size = size
      ..priority = -1;

    add(this.thumbnail!);
  }
}

class _PlayerBackground extends CustomPainterComponent {
  _PlayerBackground({
    this.borderColor = C.white,
  });
  Color borderColor;

  @override
  FutureOr<void> onLoad() {
    painter = _Painter(borderColor: borderColor);
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.borderColor,
  });
  Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width, h = size.height;

    var strokePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    var blurPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 12);

    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), strokePaint);
    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), blurPaint);
  }

  @override
  bool shouldRepaint(_Painter old) {
    return old.borderColor != borderColor;
  }
}
