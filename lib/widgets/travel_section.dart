/// ============================================================
/// 旅行攻略模块
/// ============================================================
/// 分为两部分：
///   1. 六步时间轴（从抵达机场到翻译沟通）
///   2. 推荐三日路线（中轴线 / 长城工业风 / 现代购物）
///
/// 时间轴设计：左侧渐变数字圆圈 + 连接线，右侧内容卡片带小贴士
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'common_widgets.dart';

class TravelSection extends StatelessWidget {
  const TravelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;

    /// 六步旅行指南
    final steps = [
      (t.step1Title, t.step1Desc, t.step1Tip, Icons.flight_land),
      (t.step2Title, t.step2Desc, t.step2Tip, Icons.train),
      (t.step3Title, t.step3Desc, t.step3Tip, Icons.wifi),
      (t.step4Title, t.step4Desc, t.step4Tip, Icons.directions_subway),
      (t.step5Title, t.step5Desc, t.step5Tip, Icons.local_taxi),
      (t.step6Title, t.step6Desc, t.step6Tip, Icons.translate),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: t.travelTitle, subtitle: t.travelSubtitle, icon: Icons.explore),
        const SizedBox(height: 4),
        ...steps.asMap().entries.map((e) => _TravelStepCard(
            step: e.value, index: e.key, isLast: e.key == steps.length - 1)),
        const SizedBox(height: 36),
        _RouteSection(),
      ],
    );
  }
}

/// 时间轴步骤卡片
class _TravelStepCard extends StatelessWidget {
  final (String, String, String, IconData) step;
  final int index;
  final bool isLast;
  const _TravelStepCard({required this.step, required this.index, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    final title = step.$1;
    final desc = step.$2;
    final tip = step.$3;
    final icon = step.$4;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 左侧时间轴：渐变数字圆圈 + 连接线
        SizedBox(
          width: 40,
          child: Column(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  gradient: colors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: colors.primary.withValues(alpha: 0.35), blurRadius: 8, offset: const Offset(0, 3)),
                  ],
                ),
                child: Center(
                  child: Text('${index + 1}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
                ),
              ),
              /// 连接线（最后一项不显示）
              if (!isLast)
                Container(
                  width: 2, height: 24,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [colors.primary.withValues(alpha: 0.3), colors.primary.withValues(alpha: 0.05)],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        /// 右侧内容卡片
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: colors.cardBg,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, 3))],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(icon, color: colors.primary, size: 22),
                    const SizedBox(width: 10),
                    Expanded(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.textDark))),
                  ]),
                  const SizedBox(height: 10),
                  Text(desc, style: TextStyle(fontSize: 12.5, color: colors.textMedium, height: 1.5)),
                  const SizedBox(height: 10),
                  /// 小贴士（灯泡图标 + 金色背景）
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colors.accent.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors.accent.withValues(alpha: 0.25)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 16, color: colors.accentDark),
                        const SizedBox(width: 8),
                        Expanded(child: Text(tip, style: TextStyle(fontSize: 12, color: colors.textMedium, height: 1.5))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 推荐三日路线
class _RouteSection extends StatelessWidget {
  const _RouteSection();

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;
    final colors = AppState.of(context).colors;

    final routes = [
      (t.day1Title, t.day1Route),
      (t.day2Title, t.day2Route),
      (t.day3Title, t.day3Route),
    ];

    /// 每天使用不同主题色区分
    const dayColors = [
      [Color(0xFFC41E3A), Color(0xFF8B1A2B)],
      [Color(0xFFD4A574), Color(0xFFB8860B)],
      [Color(0xFF2C3E50), Color(0xFF1A252F)],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: t.routeTitle, subtitle: t.routeSubtitle, icon: Icons.route),
        ...routes.asMap().entries.map((e) {
          final c = dayColors[e.key % 3];
          final dayTitle = e.value.$1;
          final dayRoute = e.value.$2;

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: colors.cardBg,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                /// Day 标题栏
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [c[0].withValues(alpha: 0.06), c[1].withValues(alpha: 0.12)]),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    border: Border(bottom: BorderSide(color: c[0].withValues(alpha: 0.15))),
                  ),
                  child: Row(children: [
                    Container(
                      width: 34, height: 34,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: c, begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('${e.key + 1}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(dayTitle, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark))),
                  ]),
                ),
                /// 行程条目（金色圆点列表）
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: dayRoute.map((item) {
                      final isLast = item == dayRoute.last;
                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              width: 7, height: 7,
                              decoration: BoxDecoration(color: colors.accent, borderRadius: BorderRadius.circular(4)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Text(item, style: TextStyle(fontSize: 13.5, color: colors.textDark, height: 1.6))),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
