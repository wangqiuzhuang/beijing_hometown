/// ============================================================
/// AI 智能行程生成页面
/// ============================================================
/// 功能流程：
///   1. 用户选择旅行天数（1-5天）
///   2. 用户选择兴趣偏好（8个标签，多选）
///   3. 点击生成 → 调用 DeepSeek API
///   4. 解析返回文本 → 按 Day 拆分为精美卡片展示
///
/// 支持中韩双语：所有 UI 文字根据当前语言动态切换
/// 兴趣标签也有中韩两套版本
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/translations.dart';
import '../services/ai_service.dart';

class AiPlannerScreen extends StatefulWidget {
  const AiPlannerScreen({super.key});

  @override
  State<AiPlannerScreen> createState() => _AiPlannerScreenState();
}

class _AiPlannerScreenState extends State<AiPlannerScreen> {
  int _days = 3; // 默认 3 天

  /// 兴趣标签 — 中韩两套
  static const _interestsZh = ['历史文化', '美食探店', '拍照打卡', '购物血拼', '自然风光', '亲子遛娃', '文艺小众', '夜生活'];
  static const _interestsKo = ['역사문화', '맛집탐방', '사진명소', '쇼핑', '자연풍경', '가족여행', '예술감성', '나이트라이프'];

  late List<String> _interests;
  final Set<int> _selected = {0, 1}; // 默认选中历史文化 + 美食

  bool _loading = false;
  String? _result;

  @override
  void initState() {
    super.initState();
    _interests = _interestsZh;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /// 语言变化时切换兴趣标签语言版本
    final lang = AppState.of(context).language;
    _interests = lang == AppLanguage.ko ? _interestsKo : _interestsZh;
  }

  /// 判断当前是否韩语模式
  bool get _isKo => AppState.of(context).language == AppLanguage.ko;

  /// 简单的双语文本辅助
  String _t(String zh, String ko) => _isKo ? ko : zh;

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(_t('🤖 AI 智能行程', '🤖 AI 맞춤 여행'), style: const TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white, elevation: 0,
      ),
      body: _loading ? _buildLoading(colors) : _buildContent(colors),
    );
  }

  Widget _buildContent(dynamic colors) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// 天数选择（1-5天，当前选中高亮）
        Text(_t('📅 旅行天数', '📅 여행 일수'),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.textDark)),
        const SizedBox(height: 12),
        Row(
          children: List.generate(5, (i) {
            final d = i + 1;
            final active = _days == d;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                child: GestureDetector(
                  onTap: () => setState(() => _days = d),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: active ? colors.primary : colors.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: active ? colors.primary : colors.divider),
                      boxShadow: active ? [BoxShadow(color: colors.primary.withValues(alpha: 0.2), blurRadius: 6)] : [],
                    ),
                    child: Center(
                      child: Text(_isKo ? '${d}일' : '$d天',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                              color: active ? Colors.white : colors.textMedium)),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),

        /// 兴趣偏好（多选 chips）
        Text(_t('🎯 兴趣偏好 (多选)', '🎯 관심사 (복수 선택)'),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.textDark)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: List.generate(_interests.length, (i) {
            final sel = _selected.contains(i);
            return GestureDetector(
              onTap: () => setState(() => sel ? _selected.remove(i) : _selected.add(i)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: sel ? colors.primary.withValues(alpha: 0.1) : colors.cardBg,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: sel ? colors.primary : colors.divider, width: sel ? 1.5 : 1),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(sel ? Icons.check_circle : Icons.circle_outlined, size: 16,
                      color: sel ? colors.primary : colors.textLight),
                  const SizedBox(width: 6),
                  Text(_interests[i], style: TextStyle(fontSize: 13,
                      fontWeight: sel ? FontWeight.w600 : FontWeight.normal,
                      color: sel ? colors.primary : colors.textMedium)),
                ]),
              ),
            );
          }),
        ),
        const SizedBox(height: 28),

        /// 生成 / 重新生成按钮
        SizedBox(
          width: double.infinity, height: 52,
          child: ElevatedButton(
            onPressed: _selected.isEmpty ? null : _generate,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary, disabledBackgroundColor: colors.textLight,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 2,
            ),
            child: Text(
              _result == null ? _t('✨ 生成智能行程', '✨ 일정 생성하기') : _t('🔄 重新生成', '🔄 다시 생성'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 28),

        /// 生成结果
        if (_result != null) _buildResult(colors),
      ]),
    );
  }

  /// AI 思考中的加载动画
  Widget _buildLoading(dynamic colors) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(width: 60, height: 60,
            child: CircularProgressIndicator(color: colors.primary, strokeWidth: 3)),
        const SizedBox(height: 24),
        Text(_t('AI 正在为你规划行程...', 'AI가 여행 일정을 계획 중입니다...'),
            style: TextStyle(fontSize: 16, color: colors.textMedium)),
        const SizedBox(height: 8),
        Text(_t('请稍候，这可能需要几秒钟', '잠시만 기다려주세요'),
            style: TextStyle(fontSize: 13, color: colors.textLight)),
      ]),
    );
  }

  /// 解析并展示生成结果
  Widget _buildResult(dynamic colors) {
    /// 用正则提取每天内容：【Day 1】xxx 【Day 2】xxx ...
    final dayPattern = RegExp(r'【Day (\d)】([^【]*)');
    final matches = dayPattern.allMatches(_result!).toList();

    if (matches.isEmpty) {
      /// 如果解析失败，直接展示原始文本
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: colors.cardBg, borderRadius: BorderRadius.circular(16)),
        child: Text(_result!, style: TextStyle(fontSize: 14, color: colors.textDark, height: 1.8)),
      );
    }

    /// 每天使用不同配色
    const dayColors = [
      [Color(0xFFC41E3A), Color(0xFF8B1A2B)], [Color(0xFFD4A574), Color(0xFFB8860B)],
      [Color(0xFF2C3E50), Color(0xFF1A252F)], [Color(0xFFE65100), Color(0xFFBF360C)],
      [Color(0xFF00695C), Color(0xFF004D40)],
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// 结果标题
      Row(children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(gradient: colors.primaryGradient, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Text(_isKo ? '나만의 ${_days}일 여행 일정' : '你的专属${_days}日行程',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: colors.textDark)),
      ]),
      const SizedBox(height: 16),

      /// 每天的行程卡片
      ...matches.map((m) {
        final dayNum = m.group(1)!;
        final content = m.group(2)!.trim();
        final items = content.split(RegExp(r'[；;]')).where((s) => s.trim().isNotEmpty).toList();
        final dc = dayColors[((int.tryParse(dayNum) ?? 1) - 1) % 5];

        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: colors.cardBg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
          ),
          child: Column(children: [
            /// Day 标题栏
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [dc[0].withValues(alpha: 0.06), dc[1].withValues(alpha: 0.12)]),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                border: Border(bottom: BorderSide(color: dc[0].withValues(alpha: 0.15))),
              ),
              child: Row(children: [
                Container(
                  width: 34, height: 34,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: dc, begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(dayNum,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15))),
                ),
                const SizedBox(width: 12),
                Text('Day $dayNum', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: colors.textDark)),
              ]),
            ),
            /// 行程条目
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: items.map((item) {
                  final isLast = item == items.last;
                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                        margin: const EdgeInsets.only(top: 7), width: 7, height: 7,
                        decoration: BoxDecoration(color: colors.accent, borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(item.trim(),
                          style: TextStyle(fontSize: 13.5, color: colors.textDark, height: 1.6))),
                    ]),
                  );
                }).toList(),
              ),
            ),
          ]),
        );
      }),
    ]);
  }

  /// 调用 AI 服务生成行程
  Future<void> _generate() async {
    if (_selected.isEmpty) return;
    setState(() { _loading = true; _result = null; });

    final lang = AppState.of(context).language.name;
    final interests = _selected.map((i) => _interests[i]).toList();
    final result = await AiService.generateItinerary(days: _days, interests: interests, language: lang);

    setState(() { _loading = false; _result = result; });
  }
}
