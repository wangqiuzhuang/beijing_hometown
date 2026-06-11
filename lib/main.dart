/// ============================================================
/// 北京家乡介绍 · Flutter 应用入口
/// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'utils/app_state.dart';
import 'screens/home_screen.dart';

VideoPlayerController? _heroController;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
  );
  // 提前加载视频
  _heroController = VideoPlayerController.asset('assets/videos/beijing.mp4')
    ..initialize().then((_) {
      _heroController!.setLooping(true);
      _heroController!.setVolume(0);
    });
  runApp(const BeijingApp());
}

class BeijingApp extends StatelessWidget {
  const BeijingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: Builder(
        builder: (context) {
          final colors = AppState.of(context).colors;
          return MaterialApp(
            title: '北京 · 我的家乡',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: colors.primary, primary: colors.primary, secondary: colors.accent),
              fontFamily: 'PingFang SC',
              scaffoldBackgroundColor: colors.background,
            ),
            home: HomeScreen(controller: _heroController),
          );
        },
      ),
    );
  }
}
