import '../../../export.dart';
import 'player_readonly.dart';

class PlayerHud extends PositionComponent with ParentIsA<PlayerReadonly> {
  PlayerHud({
    this.nickname = '',
  });
  late HpStatusHud hpStatus;
  late TextComponent nicknameText;

  String nickname;

  @override
  FutureOr<void> onLoad() {
    _initNicknameText();
    _initHpStatus();
  }

  void _initNicknameText() {
    nicknameText = TextComponent(
      text: nickname,
      textRenderer: TextPaint(
        style: TS.b2.c(C.onSurface),
      ),
    );
    nicknameText.position = V2(parent.width / 2, parent.height + 12);
    nicknameText.anchor = Anchor.center;
    add(nicknameText);
  }

  void _initHpStatus() {
    hpStatus = HpStatusHud();
    hpStatus.position = V2(parent.width / 2, -10);
    hpStatus.anchor = Anchor.center;
    add(hpStatus);
  }

  @override
  void update(double dt) {
    super.update(dt);

    nicknameText.text = nickname;
  }
}

class HpStatusHud extends CustomPainterComponent {
  @override
  FutureOr<void> onLoad() {
    painter = _HpStatusPainter();
    width = 64;
    height = 6;
  }
}

class _HpStatusPainter extends CustomPainter {
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
