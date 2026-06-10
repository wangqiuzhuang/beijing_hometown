/// ============================================================
/// 代表美食模块
/// ============================================================
/// 展示六大北京美食：烤鸭、炸酱面、涮羊肉、炸串、炒菜、小吃
/// 卡片布局：左图右文，与景点卡片风格统一
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/constants.dart';
import 'common_widgets.dart';

class FoodSection extends StatelessWidget {
  const FoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;
    final colors = AppState.of(context).colors;

    /// 从翻译数据构建美食列表
    final foods = [
      (t.roastDuck, t.roastDuckDesc, t.priceRoastDuck, t.roastDuckCat, BeijingImages.roastDuck),
      (t.noodle, t.noodleDesc, t.priceNoodle, t.noodleCat, BeijingImages.noodle),
      (t.hotpot, t.hotpotDesc, t.priceHotpot, t.hotpotCat, BeijingImages.hotpot),
      (t.skewer, t.skewerDesc, t.priceSkewer, t.skewerCat, BeijingImages.skewer),
      (t.stirFry, t.stirFryDesc, t.priceStirFry, t.stirFryCat, BeijingImages.stirFry),
      (t.snack, t.snackDesc, t.priceSnack, t.snackCat, BeijingImages.snack),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: t.foodTitle, subtitle: t.foodSubtitle, icon: Icons.restaurant),
        const SizedBox(height: 4),
        ...foods.asMap().entries.map((e) => _FoodCard(food: e.value, index: e.key, colors: colors)),
      ],
    );
  }
}

typedef _FoodData = (String, String, String, String, String);

class _FoodCard extends StatelessWidget {
  final _FoodData food;
  final int index;
  final dynamic colors;
  const _FoodCard({required this.food, required this.index, required this.colors});

  @override
  Widget build(BuildContext context) {
    final name = food.$1;
    final desc = food.$2;
    final price = food.$3;
    final category = food.$4;
    final imageUrl = food.$5;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 左侧：美食图片（130px 宽）
              SizedBox(
                width: 130,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(imageUrl, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [colors.primary.withValues(alpha: 0.7), colors.accent.withValues(alpha: 0.6)]),
                        ),
                        child: const Icon(Icons.restaurant, color: Colors.white30, size: 36),
                      ),
                    ),
                    Positioned(top: 8, left: 8,
                      child: Container(
                        width: 24, height: 24,
                        decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(7)),
                        child: Center(child: Text('${index + 1}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12))),
                      ),
                    ),
                  ],
                ),
              ),
              /// 右侧：信息区
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: colors.textDark))),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: colors.primary.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(6)),
                            child: Text(category, style: TextStyle(fontSize: 10, color: colors.primary, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(child: Text(desc, style: TextStyle(fontSize: 12.5, color: colors.textMedium, height: 1.5),
                          maxLines: 3, overflow: TextOverflow.ellipsis)),
                      const SizedBox(height: 8),
                      Row(children: [
                        Icon(Icons.attach_money, size: 14, color: colors.primary),
                        const SizedBox(width: 2),
                        Text(price, style: TextStyle(fontSize: 13, color: colors.primary, fontWeight: FontWeight.w600)),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
