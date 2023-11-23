import '../../../../export.dart';
import '../../hud/hp_status_hud.dart';
import '../jewel.dart';

class JewelHud extends PositionComponent {
  JewelHud({
    required this.jewel,
  });
  late TextComponent topText;

  Jewel jewel;
  late HpStatusHud hpStatus;

  @override
  FutureOr<void> onLoad() {
    width = par.width;
    topText = TextComponent(
        text: 'LV.${jewel.level} ${jewel.name}', textRenderer: TextPaint(style: TS.bodyMedium.c(C.white)))
      ..anchor = Anchor.bottomCenter;

    add(topText);
    _initHpStatus();
  }

  void _initHpStatus() {
    hpStatus = HpStatusHud(currentHp: jewel.hp, maxHp: jewel.hp);
    hpStatus.position = V2(0, -22);
    hpStatus.anchor = Anchor.bottomCenter;
    add(hpStatus);
  }

  void applyHp(int hp) {
    hpStatus.currentHp.value = hp;
  }
}
