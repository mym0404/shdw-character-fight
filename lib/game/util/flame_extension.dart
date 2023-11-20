import 'package:flame/components.dart';

extension PositionComponentExtension on PositionComponent {
  // need caution
  PositionComponent get par => parent as PositionComponent;
}
