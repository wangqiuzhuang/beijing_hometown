/// DeepSeek API 配置
/// Key 通过编译参数注入，不写在代码中
class ApiConfig {
  /// 从编译参数读取 Key：
  /// flutter run --dart-define=DEEPSEEK_KEY=你的Key
  static String get deepseekKey =>
      const String.fromEnvironment('DEEPSEEK_KEY', defaultValue: '');
}
