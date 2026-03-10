import 'package:quote_generator/quote_generator.dart';

class ShimmerBar extends StatefulWidget {
  final double width;
  final double height;
  const ShimmerBar({super.key, required this.width, required this.height});

  @override
  State<ShimmerBar> createState() => _ShimmerBarState();
}

class _ShimmerBarState extends State<ShimmerBar> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, _) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color.lerp(
            AppTheme.surfaceColor,
            AppTheme.accentColor.withValues(alpha: 0.12),
            _anim.value,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
