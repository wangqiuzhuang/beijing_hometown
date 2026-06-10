/// ============================================================
/// 主页 — 单页滚动布局
/// ============================================================
/// 采用 CustomScrollView + Sliver 实现：
///   - Hero 大图区（含语言/主题切换）
///   - 地区介绍（五大优势）
///   - 旅游景点（六大景点，左图右文）
///   - 代表美食（六大美食，左图右文）
///   - 旅行攻略（六步时间轴 + 三日路线）
///   - AI 智能行程入口卡片
///   - 北京欢迎你页脚
///
/// 底部固定导航栏：点击后通过 GlobalKey + localToGlobal 计算偏移量，
/// 使用 animateTo 平滑滚动到对应模块。
/// ============================================================

import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/translations.dart';
import '../widgets/hero_section.dart';
import '../widgets/area_section.dart';
import '../widgets/attractions_section.dart';
import '../widgets/food_section.dart';
import '../widgets/travel_section.dart';
import 'ai_planner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false; // 是否显示"回到顶部"按钮

  /// 每个模块的 GlobalKey，用于底部导航跳转
  final Map<String, GlobalKey> _sectionKeys = {
    'intro': GlobalKey(),
    'attractions': GlobalKey(),
    'food': GlobalKey(),
    'travel': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    /// 监听滚动位置：超过 400px 显示回到顶部 FAB
    _scrollController.addListener(() {
      if (_scrollController.offset > 400 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 400 && _showFab) {
        setState(() => _showFab = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 底部导航跳转：计算目标 Widget 在屏幕上的位置 → 平滑滚动过去
  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
    final targetOffset = _scrollController.offset + position.dy - 100;
    _scrollController.animateTo(
      targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    final t = AppState.of(context).t;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          /// 主体滚动区域
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              /// Hero 大图区
              const SliverToBoxAdapter(child: HeroSection()),

              /// 白色内容区（顶部圆角，向上覆盖 Hero 底部）
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.background,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 模块 1：地区介绍
                        KeyedSubtree(key: _sectionKeys['intro'], child: const AreaIntroSection()),
                        const SizedBox(height: 36),

                        /// 模块 2：旅游景点
                        KeyedSubtree(key: _sectionKeys['attractions'], child: const AttractionsSection()),
                        const SizedBox(height: 36),

                        /// 模块 3：代表美食
                        KeyedSubtree(key: _sectionKeys['food'], child: const FoodSection()),
                        const SizedBox(height: 36),

                        /// 模块 4：旅行攻略
                        KeyedSubtree(key: _sectionKeys['travel'], child: const TravelSection()),
                        const SizedBox(height: 24),

                        /// AI 智能行程入口
                        _buildAiEntryCard(colors),
                        const SizedBox(height: 24),

                        /// 页脚
                        _buildFooter(colors, t),
                        const SizedBox(height: 120), // 底部留白（导航栏高度）
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// 回到顶部 FAB
          if (_showFab)
            Positioned(
              right: 16, bottom: 100,
              child: FloatingActionButton(
                mini: true, backgroundColor: colors.primary, elevation: 4,
                onPressed: () => _scrollController.animateTo(
                  0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOutCubic),
                child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
              ),
            ),
        ],
      ),

      /// 底部固定导航栏
      bottomNavigationBar: _buildBottomNav(colors, t),
    );
  }

  /// AI 入口卡片（紫色主题）
  Widget _buildAiEntryCard(dynamic colors) {
    final isKo = AppState.of(context).language == AppLanguage.ko;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiPlannerScreen())),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF7C3AED).withValues(alpha: 0.06), const Color(0xFF7C3AED).withValues(alpha: 0.12)]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF7C3AED).withValues(alpha: 0.2)),
        ),
        child: Row(children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)]),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: const Color(0xFF7C3AED).withValues(alpha: 0.3), blurRadius: 8)],
            ),
            child: const Center(child: Text('🤖', style: TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(isKo ? 'AI 맞춤 여행 일정' : 'AI 智能行程生成',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: colors.textDark)),
              const SizedBox(height: 4),
              Text(isKo ? '취향을 선택하면 AI가 베이징 여행을 계획해드립니다' : '选择偏好，AI 为你定制专属北京攻略',
                  style: TextStyle(fontSize: 12.5, color: colors.textMedium)),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: const Color(0xFF7C3AED), borderRadius: BorderRadius.circular(20)),
            child: Text(isKo ? '시작하기' : '立即体验',
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ]),
      ),
    );
  }

  /// 底部导航栏
  Widget _buildBottomNav(dynamic colors, dynamic t) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 20, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(children: [
            _NavItem(icon: Icons.location_city_outlined, activeIcon: Icons.location_city,
                label: t.navArea, onTap: () => _scrollToSection(_sectionKeys['intro']!), colors: colors),
            _NavItem(icon: Icons.photo_camera_outlined, activeIcon: Icons.photo_camera,
                label: t.navAttractions, onTap: () => _scrollToSection(_sectionKeys['attractions']!), colors: colors),
            _NavItem(icon: Icons.restaurant_outlined, activeIcon: Icons.restaurant,
                label: t.navFood, onTap: () => _scrollToSection(_sectionKeys['food']!), colors: colors),
            _NavItem(icon: Icons.explore_outlined, activeIcon: Icons.explore,
                label: t.navTravel, onTap: () => _scrollToSection(_sectionKeys['travel']!), colors: colors),
          ]),
        ),
      ),
    );
  }

  /// 北京欢迎你页脚
  Widget _buildFooter(dynamic colors, dynamic t) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [colors.primary.withValues(alpha: 0.06), colors.accent.withValues(alpha: 0.1)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(gradient: colors.primaryGradient, borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.favorite, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 12),
        Text(t.footerTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colors.primary, letterSpacing: 3)),
        const SizedBox(height: 4),
        Text(t.footerSubtitle, style: TextStyle(fontSize: 13, color: colors.textLight)),
      ]),
    );
  }
}

/// 底部导航按钮 — 按下时有缩放/颜色动画反馈
class _NavItem extends StatefulWidget {
  final IconData icon, activeIcon;
  final String label;
  final VoidCallback onTap;
  final dynamic colors;
  const _NavItem({required this.icon, required this.activeIcon, required this.label,
      required this.onTap, required this.colors});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) { setState(() => _pressed = false); widget.onTap(); },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: _pressed ? widget.colors.primary.withValues(alpha: 0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(_pressed ? widget.activeIcon : widget.icon,
                color: _pressed ? widget.colors.primary : widget.colors.textMedium, size: 24),
            const SizedBox(height: 2),
            Text(widget.label, style: TextStyle(
                fontSize: 10, fontWeight: _pressed ? FontWeight.w600 : FontWeight.normal,
                color: _pressed ? widget.colors.primary : widget.colors.textMedium)),
          ]),
        ),
      ),
    );
  }
}
