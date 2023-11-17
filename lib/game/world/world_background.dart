import '../../export.dart';

class WorldBackground extends CustomPainterComponent {
  WorldBackground() : super(size: V2(Const.worldWidth, Const.worldHeight));

  @override
  CustomPainter? get painter => _BackgroundPainter();
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width, h = size.height;

    canvas.drawColor(Colors.black, BlendMode.src);

    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white38
      ..strokeWidth = 4;

    for (int i = 0; i <= w; i += 100) {
      canvas.drawLine(Offset(i.toDouble(), 0), Offset(i.toDouble(), h), linePaint);
    }
    for (int i = 0; i <= h; i += 100) {
      canvas.drawLine(Offset(0, i.toDouble()), Offset(w, i.toDouble()), linePaint);
    }

    var boundaryPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = C.primary
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 4);

    canvas.drawRect(
      Rect.fromPoints(
        const Offset(Const.worldPadding, Const.worldPadding),
        const Offset(Const.worldWidth - Const.worldPadding, Const.worldHeight - Const.worldPadding),
      ),
      boundaryPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
