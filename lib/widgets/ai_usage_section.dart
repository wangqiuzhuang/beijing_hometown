/// ============================================================
/// AI 技术应用模块
/// ============================================================
/// 展示项目中使用的 AI 技术：
///   1. DeepSeek 智能行程规划
///   2. AI 个性化推荐
///   3. AI 内容生成
///
/// 每个功能卡片包含标题、描述和技术标签，点击可查看详情。
/// 底部展示 AI 服务商和模型信息。
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'common_widgets.dart';

class AiUsageSection extends StatelessWidget {
  const AiUsageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;
    final colors = AppState.of(context).colors;

    /// 构建三大 AI 功能列表
    final features = [
      (t.aiFeature1Title, t.aiFeature1Desc, t.aiFeature1Tech, Icons.auto_awesome),
      (t.aiFeature2Title, t.aiFeature2Desc, t.aiFeature2Tech, Icons.recommend),
      (t.aiFeature3Title, t.aiFeature3Desc, t.aiFeature3Tech, Icons.article_outlined),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 模块标题
        SectionHeader(
          title: t.aiUsageTitle,
          subtitle: t.aiUsageSubtitle,
          icon: Icons.smart_toy_outlined,
        ),

        /// 模块简介
        HighlightCard(icon: Icons.info_outline, text: t.aiUsageIntro),
        const SizedBox(height: 4),

        /// AI 功能卡片列表
        ...features.map((f) => _AiFeatureCard(
              title: f.$1,
              description: f.$2,
              techLabel: f.$3,
              icon: f.$4,
              onTap: () => _showDetail(context, f.$1, f.$2, f.$3, f.$4),
            )),

        const SizedBox(height: 8),

        /// AI 服务商 / 模型信息
        _buildProviderInfo(colors, t),
      ],
    );
  }

  /// 底部 AI 服务商 & 模型信息卡片
  Widget _buildProviderInfo(dynamic colors, dynamic t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0D9488).withValues(alpha: 0.04),
            const Color(0xFF0F766E).withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF0D9488).withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          /// 服务商
          Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF0D9488), Color(0xFF0F766E)]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('DS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.aiUsageProvider,
                      style: TextStyle(fontSize: 11, color: colors.textLight, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 2),
                  const Text('DeepSeek',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0F766E))),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(t.aiUsageModel,
                      style: TextStyle(fontSize: 11, color: colors.textLight, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 2),
                  const Text('deepseek-chat',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0F766E))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: const Color(0xFF0D9488).withValues(alpha: 0.1)),
          const SizedBox(height: 12),
          /// 说明文字
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.lightbulb_outline, size: 16, color: colors.textLight),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.aiUsageNote,
                  style: TextStyle(fontSize: 12, color: colors.textLight, height: 1.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 弹出详细说明对话框
  void _showDetail(BuildContext context, String title, String detail, String tech, IconData icon) {
    final colors = AppState.of(context).colors;
    final t = AppState.of(context).t;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF0D9488), Color(0xFF0F766E)]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark)),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 技术标签
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF0D9488).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF0D9488).withValues(alpha: 0.2)),
              ),
              child: Text(tech, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF0D9488))),
            ),
            const SizedBox(height: 12),
            Text(detail, style: TextStyle(fontSize: 14, color: colors.textMedium, height: 1.6)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.gotIt, style: TextStyle(color: const Color(0xFF0D9488))),
          ),
        ],
      ),
    );
  }
}

/// AI 功能卡片 — 带技术标签
class _AiFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String techLabel;
  final IconData icon;
  final VoidCallback? onTap;

  const _AiFeatureCard({
    required this.title,
    required this.description,
    required this.techLabel,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                /// 青绿色 AI 技术图标
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF0D9488), Color(0xFF0F766E)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark)),
                      const SizedBox(height: 4),
                      Text(description,
                          style: TextStyle(fontSize: 12.5, color: colors.textMedium, height: 1.5),
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 8),
                      /// 技术标签
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D9488).withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFF0D9488).withValues(alpha: 0.15)),
                        ),
                        child: Text(techLabel,
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF0D9488))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right, color: colors.textLight, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
