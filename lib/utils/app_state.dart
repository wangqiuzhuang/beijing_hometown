import 'package:flutter/material.dart';
import 'translations.dart';
import 'themes.dart';

/// 全局应用状态：语言 + 主题
class AppState extends ChangeNotifier {
  AppLanguage _language = AppLanguage.zh;
  AppThemeMode _themeMode = AppThemeMode.chinaRed;

  AppLanguage get language => _language;
  AppThemeMode get themeMode => _themeMode;

  /// 获取当前语言的翻译
  TranslationSet get t => _language == AppLanguage.zh ? zh : ko;

  /// 获取当前主题配色
  AppColorTheme get colors => AppThemes.colorsOf(_themeMode);

  /// 切换语言
  void setLanguage(AppLanguage lang) {
    if (_language == lang) return;
    _language = lang;
    notifyListeners();
  }

  void toggleLanguage() {
    _language = _language == AppLanguage.zh ? AppLanguage.ko : AppLanguage.zh;
    notifyListeners();
  }

  /// 切换主题
  void setTheme(AppThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  /// 在 AppState 中获取实例
  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppStateScope>()!.state;
  }
}

// ── InheritedWidget ──

class _AppStateScope extends InheritedWidget {
  final AppState state;

  const _AppStateScope({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(_AppStateScope old) => true;
}

/// App 根包装器
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
    return ListenableBuilder(
      listenable: _state,
      builder: (context, _) {
        return _AppStateScope(
          state: _state,
          child: widget.child,
        );
      },
    );
  }

}
