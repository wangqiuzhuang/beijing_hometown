import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/app_state.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
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
              colorScheme: ColorScheme.fromSeed(
                seedColor: colors.primary,
                primary: colors.primary,
                secondary: colors.accent,
              ),
              fontFamily: 'PingFang SC',
              scaffoldBackgroundColor: colors.background,
              appBarTheme: AppBarTheme(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
