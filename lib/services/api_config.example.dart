/// DeepSeek API 配置模板
///
/// 运行时通过编译参数注入 Key，不写入代码：
///   flutter run --dart-define=DEEPSEEK_KEY=你的真实Key
///
/// Key 获取：https://platform.deepseek.com/api_keys
/// 新用户注册即送免费额度
class ApiConfig {
  static String get deepseekKey =>
      const String.fromEnvironment('DEEPSEEK_KEY', defaultValue: '');
}
