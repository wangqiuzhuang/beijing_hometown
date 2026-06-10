import 'package:flutter/material.dart';

/// 全局文本样式
class AppTextStyles {
  static const TextStyle heroTitle = TextStyle(
    fontSize: 42, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 8, height: 1.1,
  );

  static const TextStyle heroSubtitle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white70, letterSpacing: 10,
  );
}

/// ─────────── 本地图片资源 ───────────
///
/// 🔧 替换图片方法：
///   打开 assets/images/ 目录，用你自己的高清图片替换对应文件即可。
///   文件名保持不变，重新运行 Flutter 即可看到效果。
///
///   推荐图片尺寸（保持宽高比，Flutter 会自动缩放）：
///     景点图：≥ 800×450
///     美食图：≥ 400×300
///     Hero 背景：≥ 1200×600
///
class BeijingImages {
  // ── Hero 背景 ──
  static const String heroBg = 'assets/images/hero_bg.png';

  // ── 景点 (800×450) ──
  static const String forbiddenCity = 'assets/images/forbidden_city.png';
  static const String greatWall = 'assets/images/great_wall.png';
  static const String templeOfHeaven = 'assets/images/temple_heaven.png';
  static const String shougangPark = 'assets/images/shougang.png';
  static const String universalStudios = 'assets/images/universal.png';
  static const String guomaoCBD = 'assets/images/guomao.png';

  // ── 美食 (400×300) ──
  static const String roastDuck = 'assets/images/roast_duck.png';
  static const String noodle = 'assets/images/noodle.png';
  static const String hotpot = 'assets/images/hotpot.png';
  static const String skewer = 'assets/images/skewer.png';
  static const String stirFry = 'assets/images/stir_fry.png';
  static const String snack = 'assets/images/snack.png';

  /// 用 AssetImage 替代 NetworkImage
  static ImageProvider asset(String path) => AssetImage(path);
}
