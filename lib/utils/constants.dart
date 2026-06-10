/// ============================================================
/// 常量定义：文本样式 + 本地图片资源路径
/// ============================================================
/// 所有图片放在 assets/images/ 目录下
/// 替换方法：用你自己的图片覆盖同名文件即可，Flutter Hot Reload 立即生效
///
/// 推荐图片尺寸：
///   景点图 ≥ 800×450  |  美食图 ≥ 400×300  |  Hero 背景 ≥ 1200×600
/// ============================================================

import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle heroTitle = TextStyle(
    fontSize: 42, fontWeight: FontWeight.w900, color: Colors.white,
    letterSpacing: 8, height: 1.1,
  );

  static const TextStyle heroSubtitle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white70,
    letterSpacing: 10,
  );
}

/// 本地图片资源路径
/// 所有图片均为本地 Asset，确保离线可用且加载速度极快
class BeijingImages {
  static const String heroBg = 'assets/images/hero_bg.png';

  // 六大景点
  static const String forbiddenCity = 'assets/images/forbidden_city.png';
  static const String greatWall = 'assets/images/great_wall.png';
  static const String templeOfHeaven = 'assets/images/temple_heaven.png';
  static const String shougangPark = 'assets/images/shougang.png';
  static const String universalStudios = 'assets/images/universal.png';
  static const String guomaoCBD = 'assets/images/guomao.png';

  // 六大美食
  static const String roastDuck = 'assets/images/roast_duck.png';
  static const String noodle = 'assets/images/noodle.png';
  static const String hotpot = 'assets/images/hotpot.png';
  static const String skewer = 'assets/images/skewer.png';
  static const String stirFry = 'assets/images/stir_fry.png';
  static const String snack = 'assets/images/snack.png';
}
