/// ============================================================
/// 北京家乡介绍 · Flutter 应用入口
/// ============================================================
/// 本应用是一个展示北京家乡信息的单页 Flutter App
/// 主要功能：中韩双语 | 三套主题 | 地区介绍 | 景点 | 美食 | 旅行攻略 | AI 行程生成
///
/// 架构：InheritedWidget (AppStateProvider) 管理全局语言和主题状态
///   - 所有子 Widget 通过 AppState.of(context) 获取当前语言和主题色
///   - 无需第三方状态管理库，纯 Flutter 原生方案
/// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/app_state.dart';
import 'screens/home_screen.dart';

void main() {
  /// 初始化 Flutter 绑定，设置透明状态栏
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const BeijingApp());
}

/// 应用根组件
/// 用 AppStateProvider 包裹整个应用，使所有页面都能访问语言/主题状态
class BeijingApp extends StatelessWidget {
  const BeijingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: Builder(
        builder: (context) {
          /// 从 AppState 获取当前主题配色，用于 MaterialApp 的全局主题
          final colors = AppState.of(context).colors;
          return MaterialApp(
            title: '北京 · 我的家乡',
            debugShowCheckedModeBanner: false, // 去掉右上角 DEBUG 标签
            theme: ThemeData(
              /// 使用 ColorScheme.fromSeed 生成一套协调的 Material 3 配色
              colorScheme: ColorScheme.fromSeed(
                seedColor: colors.primary,
                primary: colors.primary,
                secondary: colors.accent,
              ),
              fontFamily: 'PingFang SC',
              scaffoldBackgroundColor: colors.background,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
