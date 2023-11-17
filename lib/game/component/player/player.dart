import 'package:flame/events.dart';

import '../../../export.dart';

class Player extends PositionComponent with GRef {
  Player({
    required this.isMe,
    this.circleSize = Const.initialPlayerSize,
  });

  double circleSize;
  bool isMe;
  double maxSpeed = 1000;
  V2 velocity = V2.zero();

  late final _PlayerBackground bg = _PlayerBackground();

  @override
  FutureOr<void> onLoad() {
    add(bg..size = V2.all(circleSize));
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
