import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/translations.dart';
import '../utils/themes.dart';
import '../utils/constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppState.of(context).colors;
    final t = AppState.of(context).t;
    final appState = AppState.of(context);

    return SizedBox(
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BeijingImages.heroBg,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              decoration: BoxDecoration(gradient: colors.primaryGradient),
            ),
          ),
          Container(decoration: BoxDecoration(gradient: colors.heroGradient)),
          // 装饰圆
          Positioned(
            top: -40, right: -40,
            child: Container(
              width: 200, height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.06), width: 1),
              ),
            ),
          ),
          // 主文字
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 36, 28, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 顶部控制区 ──
                  _buildControlBar(appState, colors),
                  const Spacer(),
                  Container(
                    width: 40, height: 3,
                    decoration: BoxDecoration(color: colors.accent, borderRadius: BorderRadius.circular(2)),
                  ),
                  const SizedBox(height: 12),
                  Text(t.heroTitle, style: AppTextStyles.heroTitle),
                  const SizedBox(height: 6),
                  Text(t.heroSubtitle, style: AppTextStyles.heroSubtitle),
                  const SizedBox(height: 4),
                  Container(width: 80, height: 1, color: colors.accent.withValues(alpha: 0.5)),
                  const SizedBox(height: 12),
                  Text(t.heroTagline, style: const TextStyle(fontSize: 15, color: Colors.white60, letterSpacing: 2)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _StatChip(icon: Icons.location_on, value: t.heroStatCapital, label: '中国', color: colors.accent),
                      const SizedBox(width: 10),
                      _StatChip(icon: Icons.history, value: '3000+', label: t.heroStatHistory, color: colors.accent),
                      const SizedBox(width: 10),
                      _StatChip(icon: Icons.people, value: '2189', label: '만', color: colors.accent),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 语言 + 主题切换栏
  Widget _buildControlBar(AppState appState, dynamic colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // ── 语言切换 ──
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LangChip(
                label: '中文',
                active: appState.language == AppLanguage.zh,
                onTap: () => appState.setLanguage(AppLanguage.zh),
              ),
              const SizedBox(width: 2),
              _LangChip(
                label: '한국어',
                active: appState.language == AppLanguage.ko,
                onTap: () => appState.setLanguage(AppLanguage.ko),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        // ── 主题色点 ──
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: AppThemes.all.map((theme) {
              final mode = AppThemeMode.values[AppThemes.all.indexOf(theme)];
              final active = appState.themeMode == mode;
              return Padding(
                padding: EdgeInsets.only(left: AppThemes.all.indexOf(theme) == 0 ? 0 : 6),
                child: GestureDetector(
                  onTap: () => appState.setTheme(mode),
                  child: Container(
                    width: active ? 22 : 18,
                    height: active ? 22 : 18,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [theme.primary, theme.primaryDark]),
                      shape: BoxShape.circle,
                      border: active
                          ? Border.all(color: Colors.white, width: 2.5)
                          : Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
                      boxShadow: active
                          ? [BoxShadow(color: theme.primary.withValues(alpha: 0.5), blurRadius: 6)]
                          : [],
                    ),
                    child: active
                        ? const Icon(Icons.check, color: Colors.white, size: 12)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

/// 语言切换胶囊
class _LangChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _LangChip({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: active ? const Color(0xFFC41E3A) : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatChip({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text('$value ', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        ],
      ),
    );
  }
}
