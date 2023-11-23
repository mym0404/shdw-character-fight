import '../../../export.dart';

class HpStatusHud extends CustomPainterComponent {
  HpStatusHud({
    required int maxHp,
    required int currentHp,
  })  : maxHp = VAL(maxHp),
        currentHp = VAL(currentHp);

  @override
  _HpStatusPainter get painter => _HpStatusPainter(maxHp: maxHp, currentHp: currentHp);

  VAL<int> currentHp, maxHp;

  @override
  FutureOr<void> onLoad() {
    width = 64;
    height = 6;
  }
}

class _HpStatusPainter extends CustomPainter {
  _HpStatusPainter({
    required this.currentHp,
    required this.maxHp,
  }) : super(repaint: Listenable.merge([currentHp, maxHp]));

  VAL<int> currentHp, maxHp;

  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;

    var borderPaint = Paint()..color = C.white;

    var gradient = const LinearGradient(
            colors: [Colors.greenAccent, Colors.green], begin: Alignment.topLeft, end: Alignment.bottomRight)
        .createShader(Offset.zero & size);
    var hpPaint = Paint()..shader = gradient;

    canvas.drawRRect(RRect.fromLTRBR(0, 0, w, h, 2.radius), borderPaint);
    var percent = currentHp.value / maxHp.value;
    var currentHpWidth = max(0.0, (w - 2) * percent);
    canvas.drawRRect(RRect.fromLTRBR(1, 1, 1 + currentHpWidth, h - 1, 2.radius), hpPaint);
  }

  @override
  bool shouldRepaint(_HpStatusPainter oldDelegate) {
    return false;
  }
}
