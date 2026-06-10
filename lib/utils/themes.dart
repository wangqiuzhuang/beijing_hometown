/// ============================================================
/// 主题配色系统
/// ============================================================
/// 三套配色方案：
///   1. 中国红 — 红墙帝王配色，庄重大气
///   2. 首尔蓝 — 现代冷色调，清爽时尚
///   3. 森林绿 — 自然清新，护眼舒适
///
/// 每套主题包含：主色、深色变体、强调色、背景色、文字色等完整色板
/// 所有 Widget 通过 AppState.of(context).colors 动态获取当前配色
/// ============================================================

import 'package:flutter/material.dart';

/// 主题模式枚举
enum AppThemeMode { chinaRed, seoulBlue, forestGreen }

/// 一套完整的动态配色方案
class AppColorTheme {
  final Color primary;     // 主色（按钮、标签、高亮）
  final Color primaryDark; // 主色深色变体（渐变用）
  final Color accent;      // 强调色（金色点缀）
  final Color accentDark;  // 强调色深色变体
  final Color background;  // 页面背景色
  final Color cardBg;      // 卡片背景色
  final Color textDark;    // 主文字色
  final Color textMedium;  // 副文字色
  final Color textLight;   // 辅助文字色
  final Color divider;     // 分割线色
  final String name;       // 主题名称（用于设置面板显示）

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

  /// 主色渐变（用于图标背景、按钮等）
  Gradient get primaryGradient => LinearGradient(
        colors: [primary, primaryDark],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  /// Hero 区域图片上的暗色渐变遮罩
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

/// 所有主题配色定义
class AppThemes {
  static const chinaRed = AppColorTheme(
    primary: Color(0xFFC41E3A),     // 中国红
    primaryDark: Color(0xFF8B1A2B),
    accent: Color(0xFFD4A574),      // 帝王金
    accentDark: Color(0xFFB8860B),
    background: Color(0xFFFAFAFA),
    cardBg: Colors.white,
    textDark: Color(0xFF2C2C2C),
    textMedium: Color(0xFF666666),
    textLight: Color(0xFF999999),
    divider: Color(0xFFEEEEEE),
    name: '中国红',
  );

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

  /// 根据枚举获取对应配色
  static AppColorTheme colorsOf(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.chinaRed: return chinaRed;
      case AppThemeMode.seoulBlue: return seoulBlue;
      case AppThemeMode.forestGreen: return forestGreen;
    }
  }

  static const all = [chinaRed, seoulBlue, forestGreen];
}
