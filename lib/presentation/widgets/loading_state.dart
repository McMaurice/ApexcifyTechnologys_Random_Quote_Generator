import 'package:quote_generator/quote_generator.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBar(width: 80, height: 20),
          const SizedBox(height: 28),
          ShimmerBar(width: double.infinity, height: 16),
          const SizedBox(height: 10),
          ShimmerBar(width: double.infinity, height: 16),
          const SizedBox(height: 10),
          ShimmerBar(width: 200, height: 16),
          const SizedBox(height: 32),
          ShimmerBar(width: 40, height: 1),
          const SizedBox(height: 20),
          ShimmerBar(width: 120, height: 14),
        ],
      ),
    );
  }
}
