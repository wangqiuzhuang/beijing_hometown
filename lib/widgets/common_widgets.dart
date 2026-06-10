/// ============================================================
/// 公共可复用组件
/// ============================================================
/// SectionHeader  — 统一样式的模块标题（渐变图标 + 中英双行）
/// HighlightCard  — 带边框的引言卡片（用于模块开头总结）
/// InfoCard       — 可点击的信息卡片（箭头 + 图标 + 标题 + 描述）
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';

/// 模块标题组件
/// 样式：左侧渐变圆角图标 | 标题 (大字) + 英文副标题 (小字)
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const SectionHeader({super.key, required this.title, this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // 渐变背景圆角图标
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              gradient: colors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.3),
                  blurRadius: 8, offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colors.textDark)),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(subtitle!,
                    style: TextStyle(fontSize: 11, color: colors.textLight, letterSpacing: 1.5, fontWeight: FontWeight.w500)),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// 引言卡片 — 带主题色边框的渐变背景卡片
class HighlightCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const HighlightCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary.withValues(alpha: 0.04), colors.accent.withValues(alpha: 0.08)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.primary.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: colors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 14, color: colors.textMedium, height: 1.6)),
          ),
        ],
      ),
    );
  }
}

/// 可点击信息卡片 — 用于地区优势列表
/// 点击后弹出详细对话框
class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  const InfoCard({super.key, required this.title, required this.description, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 3)),
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
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: colors.primary, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark)),
                      const SizedBox(height: 4),
                      Text(description, style: TextStyle(fontSize: 12.5, color: colors.textMedium, height: 1.5)),
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
