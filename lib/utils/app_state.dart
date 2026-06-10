/// ============================================================
/// 全局应用状态管理（语言 + 主题）
/// ============================================================
/// 设计思路：
///   不引入 Provider/Riverpod 等第三方库，用 Flutter 原生的 InheritedWidget
///   搭配 ChangeNotifier 实现轻量级全局状态管理。
///
/// 使用方式：
///   - 获取状态：AppState.of(context).colors / .t / .language
///   - 切换语言：AppState.of(context).setLanguage(AppLanguage.ko)
///   - 切换主题：AppState.of(context).setTheme(AppThemeMode.seoulBlue)
///
/// 核心机制：
///   ListenableBuilder 监听 ChangeNotifier → 状态变化时重建 InheritedWidget
///   → 所有 dependOnInheritedWidget 的子 Widget 自动刷新
/// ============================================================

import 'package:flutter/material.dart';
import 'translations.dart';
import 'themes.dart';

/// 全局应用状态
class AppState extends ChangeNotifier {
  AppLanguage _language = AppLanguage.ko;   // 默认韩语
  AppThemeMode _themeMode = AppThemeMode.chinaRed; // 当前主题

  AppLanguage get language => _language;
  AppThemeMode get themeMode => _themeMode;

  /// 快捷获取当前语言的翻译文本
  TranslationSet get t => _language == AppLanguage.zh ? zh : ko;

  /// 快捷获取当前主题的配色方案
  AppColorTheme get colors => AppThemes.colorsOf(_themeMode);

  void setLanguage(AppLanguage lang) {
    if (_language == lang) return;
    _language = lang;
    notifyListeners(); // 通知所有监听者重建
  }

  void toggleLanguage() {
    _language = _language == AppLanguage.zh ? AppLanguage.ko : AppLanguage.zh;
    notifyListeners();
  }

  void setTheme(AppThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  /// 从 BuildContext 中获取 AppState 实例
  /// 调用此方法会自动订阅 AppState 的变化（通过 dependOnInheritedWidget）
  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppStateScope>()!.state;
  }
}

/// InheritedWidget 包装器：将 AppState 注入 Widget 树
class _AppStateScope extends InheritedWidget {
  final AppState state;
  const _AppStateScope({required this.state, required super.child});

  @override
  bool updateShouldNotify(_AppStateScope old) => true;
}

/// 应用根节点：创建 AppState 实例并注入到 Widget 树
class AppStateProvider extends StatefulWidget {
  final Widget child;
  const AppStateProvider({super.key, required this.child});

  @override
  State<AppStateProvider> createState() => _AppStateProviderState();
}

class _AppStateProviderState extends State<AppStateProvider> {
  final AppState _state = AppState();

  @override
  Widget build(BuildContext context) {
    /// ListenableBuilder 监听 _state (ChangeNotifier)，
    /// 当语言或主题变化时，重建整个子树
    return ListenableBuilder(
      listenable: _state,
      builder: (context, _) {
        return _AppStateScope(state: _state, child: widget.child);
      },
    );
  }
}
