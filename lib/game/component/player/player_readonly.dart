import 'package:flame/layout.dart';
import 'package:http/http.dart' as http;

import '../../../export.dart';
import '../weapon/player_weapon.dart';
import 'player_hud.dart';

class PlayerReadonly extends PositionComponent {
  PlayerReadonly({
    required this.level,
  }) : super(
          size: V2(64, 64),
          anchor: Anchor.center,
        );

  final _PlayerBackground bg = _PlayerBackground();
  late PlayerHud hud;
  Component? thumbnail;

  int level;

  @override
  FutureOr<void> onLoad() {
    _initBackground();
    _initHud();
    _initWeapon();
  }

  Future<void> _initBackground() async {
    add(bg..size = size);
  }

  void _initHud() {
    hud = PlayerHud();
    add(hud);
  }

  void _initWeapon() {
    add(AlignComponent(child: PlayerWeapon(), alignment: Anchor.center)..priority = -10);
  }

  void updatePosition(double x, double y) {
    position = V2(x, y);
  }

  void updateBackgroundBorderColor(Color color) {
    bg.borderColor = color;
  }

  void updateNickname(String nickname) {
    hud.nickname = nickname;
  }

  Future<void> updateThumbnail(String thumbnail) async {
    final response = await http.get(Uri.parse(thumbnail));
    final image = await decodeImageFromList(response.bodyBytes);

    this.thumbnail?.removeFromParent();

    this.thumbnail = ClipComponent.circle(
      children: [
        SpriteComponent.fromImage(image)..size = size,
      ],
    )..size = size;

    add(this.thumbnail!);
  }
}

class _PlayerBackground extends CustomPainterComponent {
  _PlayerBackground({
    this.borderColor = C.white,
  });
  Color borderColor;

  @override
  CustomPainter? get painter => _Painter(borderColor: borderColor);
}

class _Painter extends CustomPainter {
  _Painter({
    required this.borderColor,
  });
  Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width, h = size.height;

    var paint = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(w / 2, h / 2), min(w / 2, h / 2), paint);
  }

  @override
  bool shouldRepaint(_Painter old) {
    return old.borderColor != borderColor;
  }
}
