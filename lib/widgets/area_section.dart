/// ============================================================
/// 家乡地区介绍模块
/// ============================================================
/// 展示北京五大优势：地铁交通、医疗资源、教育、移动支付、文化生活
/// 每个优势卡片可点击 → 弹出详细说明对话框
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import 'common_widgets.dart';

class AreaIntroSection extends StatelessWidget {
  const AreaIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;

    /// 从翻译数据动态构建五大优势列表
    final advantages = [
      (t.advantageSubway, t.advantageSubwayDesc, t.advantageSubwayDetail, Icons.subway),
      (t.advantageMedical, t.advantageMedicalDesc, t.advantageMedicalDetail, Icons.local_hospital),
      (t.advantageEducation, t.advantageEducationDesc, t.advantageEducationDetail, Icons.school),
      (t.advantagePayment, t.advantagePaymentDesc, t.advantagePaymentDetail, Icons.phone_android),
      (t.advantageCulture, t.advantageCultureDesc, t.advantageCultureDetail, Icons.theater_comedy),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: t.areaTitle, subtitle: t.areaSubtitle, icon: Icons.location_city),
        HighlightCard(icon: Icons.map, text: t.areaHighlight),  // 北京总述
        const SizedBox(height: 4),
        /// 五大优势卡片列表
        ...advantages.map((a) => InfoCard(
              title: a.$1,      // 优势标题
              description: a.$2, // 简短描述
              icon: a.$4,       // 图标
              onTap: () => _showDetail(context, a.$1, a.$3, a.$4), // 点击查看详情
            )),
      ],
    );
  }

  /// 弹出详细说明对话框
  void _showDetail(BuildContext context, String title, String detail, IconData icon) {
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
              decoration: BoxDecoration(gradient: colors.primaryGradient, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark))),
          ],
        ),
        content: Text(detail, style: TextStyle(fontSize: 14, color: colors.textMedium, height: 1.6)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.gotIt, style: TextStyle(color: colors.primary)),
          ),
        ],
      ),
    );
  }
}
