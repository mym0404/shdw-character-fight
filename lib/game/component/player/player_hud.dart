import '../../../export.dart';
import '../../state/player_state.dart';
import '../../util/DisposeBag.dart';
import 'player.dart';

class PlayerHud extends PositionComponent with ParentIsA<Player>, DisposeBag {
  PlayerHud({required this.state});
  late TextComponent nickname;
  BS<PlayerState> state;

  @override
  FutureOr<void> onLoad() {
    nickname = TextComponent(
      text: state.value.nickname,
      textRenderer: TextPaint(
        style: TS.b2.c(C.onSurface),
      ),
    );

    listenStream(state, (v) {
      nickname.text = v.nickname;
    });

    add(nickname..position = V2(0, parent.circleSize));
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
