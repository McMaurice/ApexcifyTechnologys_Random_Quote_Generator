import 'package:quote_generator/quote_generator.dart';

class AppTheme {
  static const _bgColor = Color(0xFF0A0A0F);
  static const _surfaceColor = Color(0xFF13131A);
  static const _accentColor = Color(0xFFD4AF37);
  static const _textPrimary = Color(0xFFF0EDE4);
  static const _textSecondary = Color(0xFF8A8799);

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _bgColor,
    colorScheme: const ColorScheme.dark(primary: _accentColor, surface: _surfaceColor),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: _textPrimary,
        height: 1.65,
        letterSpacing: 0.3,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: _accentColor,
        letterSpacing: 3.0,
      ),
      bodySmall: TextStyle(fontSize: 12, color: _textSecondary, letterSpacing: 1.5),
    ),
  );

  static const bgColor = _bgColor;
  static const surfaceColor = _surfaceColor;
  static const accentColor = _accentColor;
  static const textPrimary = _textPrimary;
  static const textSecondary = _textSecondary;
}
