import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/layout.dart';
import 'package:http/http.dart' as http;

import '../../../export.dart';
import '../../state/player_state.dart';
import '../../util/DisposeBag.dart';
import '../weapon/player_weapon.dart';
import 'player_hud.dart';

class Player extends PositionComponent with GRef, CollisionCallbacks, DisposeBag {
  Player({
    this.circleSize = Const.initialPlayerSize,
    required this.state,
  });

  double circleSize;
  double maxSpeed = 1000;
  V2 velocity = V2.zero();

  late PlayerHud hud;

  final BS<PlayerState> state;

  late final _PlayerBackground bg = _PlayerBackground();

  @override
  FutureOr<void> onLoad() async {
    size = V2.all(circleSize);

    await _initBackground();
    _initHud();
    _initWeapon();
    add(CircleHitbox());
  }

  Future<void> _initBackground() async {
    add(bg..size = size);

    final response = await http.get(Uri.parse(state.value.thumbnail));
    final image = await decodeImageFromList(response.bodyBytes);

    add(ClipComponent.circle(children: [SpriteComponent.fromImage(image)..size = size])..size = size);
  }

  void _initHud() {
    hud = PlayerHud(state: state);
    add(hud);
  }

  void _initWeapon() {
    add(AlignComponent(child: PlayerWeapon(), alignment: Anchor.center)..priority = -10);
  }

  void moveWithMousePosition(PointerHoverInfo info) {
    var worldPosition = game.cam.globalToLocal(info.eventPosition.widget);
    var radians = V2(1, 0).angleToSigned(worldPosition - position);

    var speed = worldPosition.distanceTo(position).clamp(0, maxSpeed);

    velocity.x = cos(radians) * speed;
    velocity.y = sin(radians) * speed;
  }

  @override
  void update(double dt) {
    super.update(dt);
    size = Vector2.all(circleSize);
    _updatePosition(dt);
  }

  void _updatePosition(double dt) {
    position += velocity * dt;

    // Clamp with boundary
    position.x = position.x.clamp(Const.worldPadding, Const.worldWidth - Const.worldPadding - circleSize);
    position.y = position.y.clamp(Const.worldPadding, Const.worldHeight - Const.worldPadding - circleSize);
  }
}

class _PlayerBackground extends CustomPainterComponent {
  @override
  CustomPainter? get painter => _Painter();
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width, h = size.height;

    var paint = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
