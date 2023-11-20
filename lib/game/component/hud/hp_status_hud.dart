import '../../../export.dart';

class HpStatusHud extends CustomPainterComponent {
  HpStatusHud({
    required this.maxHp,
    required this.currentHp,
  });
  int maxHp, currentHp;

  @override
  FutureOr<void> onLoad() {
    painter = _HpStatusPainter(maxHp: maxHp, currentHp: currentHp);
    width = 64;
    height = 6;
  }
}

class _HpStatusPainter extends CustomPainter {
  _HpStatusPainter({
    required this.maxHp,
    required this.currentHp,
  });
  int maxHp, currentHp;
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;

    var borderPaint = Paint()..color = C.white;

    var gradient = const LinearGradient(
            colors: [Colors.greenAccent, Colors.green], begin: Alignment.topLeft, end: Alignment.bottomRight)
        .createShader(Offset.zero & size);
    var hpPaint = Paint()..shader = gradient;

    canvas.drawRRect(RRect.fromLTRBR(0, 0, w, h, 2.radius), borderPaint);
    canvas.drawRRect(RRect.fromLTRBR(1, 1, w - 1, h - 1, 2.radius), hpPaint);
  }

  @override
  bool shouldRepaint(_HpStatusPainter oldDelegate) {
    return oldDelegate.maxHp != maxHp || oldDelegate.currentHp != currentHp;
  }
}
