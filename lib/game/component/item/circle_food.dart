import 'package:flame/collisions.dart';

import '../../../export.dart';

class CircleFood extends CustomPainterComponent with CollisionCallbacks {
  @override
  FutureOr<void> onLoad() {
    size = V2(32, 32);
    add(CircleHitbox());
  }

  @override
  CustomPainter? get painter => _Painter();
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;
    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), Paint()..color = C.primary50);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
