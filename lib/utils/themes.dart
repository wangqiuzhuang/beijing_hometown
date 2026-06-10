import 'package:flutter/material.dart';

/// 主题模式
enum AppThemeMode { chinaRed, seoulBlue, forestGreen }

/// 动态颜色主题
class AppColorTheme {
  final Color primary;
  final Color primaryDark;
  final Color accent;
  final Color accentDark;
  final Color background;
  final Color cardBg;
  final Color textDark;
  final Color textMedium;
  final Color textLight;
  final Color divider;
  final String name;

  const AppColorTheme({
    required this.primary,
    required this.primaryDark,
    required this.accent,
    required this.accentDark,
    required this.background,
    required this.cardBg,
    required this.textDark,
    required this.textMedium,
    required this.textLight,
    required this.divider,
    required this.name,
  });

  // 渐变
  Gradient get primaryGradient => LinearGradient(
        colors: [primary, primaryDark],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  Gradient get heroGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withValues(alpha: 0.25),
          Colors.black.withValues(alpha: 0.5),
          Colors.black.withValues(alpha: 0.75),
        ],
      );
}

class AppThemes {
  /// 中国红（默认）
  static const chinaRed = AppColorTheme(
    primary: Color(0xFFC41E3A),
    primaryDark: Color(0xFF8B1A2B),
    accent: Color(0xFFD4A574),
    accentDark: Color(0xFFB8860B),
    background: Color(0xFFFAFAFA),
    cardBg: Colors.white,
    textDark: Color(0xFF2C2C2C),
    textMedium: Color(0xFF666666),
    textLight: Color(0xFF999999),
    divider: Color(0xFFEEEEEE),
    name: '中国红',
  );

  /// 首尔蓝
  static const seoulBlue = AppColorTheme(
    primary: Color(0xFF1565C0),
    primaryDark: Color(0xFF0D3B78),
    accent: Color(0xFF64B5F6),
    accentDark: Color(0xFF1E88E5),
    background: Color(0xFFF5F8FC),
    cardBg: Colors.white,
    textDark: Color(0xFF1A1A2E),
    textMedium: Color(0xFF546E7A),
    textLight: Color(0xFF90A4AE),
    divider: Color(0xFFECEFF1),
    name: '首尔蓝',
  );

  /// 森林绿
  static const forestGreen = AppColorTheme(
    primary: Color(0xFF2E7D32),
    primaryDark: Color(0xFF1B5E20),
    accent: Color(0xFFA5D6A7),
    accentDark: Color(0xFF43A047),
    background: Color(0xFFF6FBF6),
    cardBg: Colors.white,
    textDark: Color(0xFF1B2E1B),
    textMedium: Color(0xFF4A6741),
    textLight: Color(0xFF7D9B76),
    divider: Color(0xFFE8F0E8),
    name: '森林绿',
  );

  static AppColorTheme colorsOf(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.chinaRed:
        return chinaRed;
      case AppThemeMode.seoulBlue:
        return seoulBlue;
      case AppThemeMode.forestGreen:
        return forestGreen;
    }
  }

  static const all = [chinaRed, seoulBlue, forestGreen];
}
