import '../../../export.dart';
import '../hud/hp_status_hud.dart';
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
    hpStatus = HpStatusHud(maxHp: 100, currentHp: 100);
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
