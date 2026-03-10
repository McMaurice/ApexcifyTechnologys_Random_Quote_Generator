import 'package:quote_generator/quote_generator.dart';

class CounterBadge extends StatelessWidget {
  final int count;
  const CounterBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.accentColor.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 12, color: AppTheme.accentColor.withValues(alpha: 0.8)),
          const SizedBox(width: 6),
          Text(
            '$count viewed',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 11, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }
}
