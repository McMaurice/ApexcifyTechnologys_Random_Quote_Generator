import 'package:quote_generator/quote_generator.dart';

class IdTag extends StatelessWidget {
  final int id;
  const IdTag({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.accentColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.accentColor.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Text(
        'QUOTE #$id',
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: AppTheme.accentColor, fontSize: 10),
      ),
    );
  }
}
