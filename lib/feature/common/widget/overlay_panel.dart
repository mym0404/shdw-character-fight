import '../../../export.dart';

class OverlayPanel extends StatelessWidget {
  const OverlayPanel({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: 12.radius,
        border: Border.all(color: C.onSurface),
        boxShadow: [
          const BoxShadow(color: Colors.white38, blurRadius: 20),
          BoxShadow(color: C.primary50, blurRadius: 12),
        ],
        color: C.surface,
      ),
      child: child,
    );
  }
}
