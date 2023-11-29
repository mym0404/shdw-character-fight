import '../../../export.dart';
import '../../state/player_state.dart';
import '../../util/level_manager.dart';
import '../hud/hp_status_hud.dart';
import 'player_readonly.dart';

class PlayerHud extends PositionComponent with ParentIsA<PlayerReadonly> {
  PlayerHud({
    required PlayerState initialPlayerState,
  })  : nickname = initialPlayerState.nickname,
        hpStatus = HpStatusHud(
            maxHp: LevelManager.maxHpByExp(initialPlayerState.exp), currentHp: initialPlayerState.hp);
  final HpStatusHud hpStatus;
  late TextComponent nicknameText;

  String nickname;

  int get maxHp => hpStatus.maxHp.value;
  set maxHp(int value) => hpStatus.maxHp.value = value;

  int get hp => hpStatus.currentHp.value;
  set hp(int value) => hpStatus.currentHp.value = value;

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
    nicknameText.position = V2(parent.width / 2, -12);
    nicknameText.anchor = Anchor.center;
    add(nicknameText);
  }

  void _initHpStatus() {
    hpStatus.position = V2(parent.width / 2, -28);
    hpStatus.anchor = Anchor.center;
    add(hpStatus);
  }

  @override
  void update(double dt) {
    super.update(dt);

    nicknameText.text = nickname;
    hpStatus.currentHp.value = hp;
  }
}
