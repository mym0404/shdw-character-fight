import '../../../export.dart';
import 'player.dart';

class PlayerHud extends PositionComponent with ParentIsA<Player> {
  PlayerHud({
    this.nickname = '',
  });
  late TextComponent nicknameText;

  String nickname;

  @override
  FutureOr<void> onLoad() {
    nicknameText = TextComponent(
      text: nickname,
      textRenderer: TextPaint(
        style: TS.b2.c(C.onSurface),
      ),
    );

    add(nicknameText..position = V2(0, parent.circleSize));
  }

  @override
  void update(double dt) {
    super.update(dt);

    nicknameText.text = nickname;
  }
}
