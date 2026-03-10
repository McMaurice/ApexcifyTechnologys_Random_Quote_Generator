import 'package:quote_generator/quote_generator.dart';

class QuoteCard extends StatelessWidget {
  final QuoteModel quote;
  final AnimationController controller;
  final Animation<double> fadeAnim;
  final Animation<double> slideAnim;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.controller,
    required this.fadeAnim,
    required this.slideAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: fadeAnim.value,
        child: Transform.translate(offset: Offset(0, slideAnim.value), child: child),
      ),
      child: Container(
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
            IdTag(id: quote.id),
            const SizedBox(height: 28),
            Text(
              '\u201C',
              style: TextStyle(
                fontSize: 72,
                height: 0.5,
                color: AppTheme.accentColor.withValues(alpha: 0.4),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Text(quote.text, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 32),
            Container(width: 40, height: 1, color: AppTheme.accentColor.withValues(alpha: 0.4)),
            const SizedBox(height: 20),
            Text(
              '— ${quote.author}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
                letterSpacing: 1.0,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
