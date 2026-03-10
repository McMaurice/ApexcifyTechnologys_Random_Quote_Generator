import 'package:quote_generator/quote_generator.dart';

class ErrorState extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorState({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.accentColor.withValues(alpha: 0.15), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentColor.withValues(alpha: 0.05),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_rounded, color: AppTheme.accentColor.withValues(alpha: 0.5), size: 48),
          const SizedBox(height: 20),
          Text(
            'Could not fetch a quote.\nCheck your connection.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary, height: 1.8),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'TRY AGAIN',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.accentColor, letterSpacing: 2.0),
            ),
          ),
        ],
      ),
    );
  }
}
