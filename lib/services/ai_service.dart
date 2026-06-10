/// ============================================================
/// AI 服务 — 调用 DeepSeek API 生成旅行行程
/// ============================================================
/// 工作原理：
///   1. 收集用户的偏好（天数、兴趣标签）
///   2. 构造 prompt（中文或韩文）
///   3. 调用 DeepSeek Chat API (OpenAI 兼容格式)
///   4. 解析返回的文本，提取每天的行程信息
///
/// DeepSeek 优势：国产模型，中文理解能力强，价格极低（约 OpenAI 的 1/10）
///
/// 安全说明：
///   API Key 存放在 lib/services/api_config.dart (已 gitignore)
///   他人 clone 后需创建自己的 api_config.dart 文件
/// ============================================================

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class AiService {
  static const _baseUrl = 'https://api.deepseek.com';
  static String get _apiKey => ApiConfig.deepseekKey;  // 从本地配置文件读取
  static const _model = 'deepseek-chat';

  /// 检查 Key 是否已配置
  static bool get isConfigured => _apiKey.isNotEmpty;

  /// 根据用户偏好生成北京旅行行程
  static Future<String> generateItinerary({
    required int days,
    required List<String> interests,
    required String language,
  }) async {
    /// 未配置 Key 时返回友好提示，不影响 App 其他功能
    if (!isConfigured) {
      return language == 'ko'
          ? '⚠️ DeepSeek API Key가 설정되지 않았습니다.\n\n'
              '실행 시 --dart-define 으로 Key를 전달해주세요:\n'
              'flutter run --dart-define=DEEPSEEK_KEY=sk-xxxx\n\n'
              '📩 담당 학생에게 Key를 요청하거나\n'
              '🔑 https://platform.deepseek.com/api_keys 에서 직접 발급 가능합니다.'
          : '⚠️ 尚未配置 DeepSeek API Key。\n\n'
              '请使用以下命令运行以传入 Key：\n'
              'flutter run --dart-define=DEEPSEEK_KEY=sk-xxxx\n\n'
              '📩 请联系学生获取 API Key，或前往\n'
              '🔑 https://platform.deepseek.com/api_keys 自行注册（免费）';
    }

    final langName = language == 'ko' ? '韩语' : '中文';
    final interestText = interests.join('、');

    /// 构建 prompt：告诉 AI 它的角色、用户偏好和输出格式要求
    final prompt = '''
你是一个专业的北京旅行规划师。请根据以下用户偏好，生成一份详细的北京${days}日游行程攻略。

用户兴趣偏好：$interestText
旅行天数：${days}天
输出语言：$langName

请严格按照以下格式输出，每天一个段落，用"【Day N】"作为分隔：

【Day 1】上午：xxx；中午：xxx；下午：xxx；晚上：xxx。交通提示：xxx。
【Day 2】上午：xxx；中午：xxx；下午：xxx；晚上：xxx。交通提示：xxx。
...

要求：
1. 每天安排4个时段（上午/中午/下午/晚上），每个时段1-2个具体景点或餐厅名称
2. 交通提示给出具体的地铁线路或出行方式
3. 根据用户兴趣偏好优先安排相关内容
4. 考虑地理位置合理性，不要安排相距太远的景点在同半天
5. 如果语言是韩语，请全部用韩文输出；如果是中文，用中文输出
6. 每个时段的描述控制在20字以内
7. 在最后加一行"📌 预算估算："给出大致的总花费范围（人民币）
''';

    try {
      /// 调用 DeepSeek Chat Completions API (与 OpenAI 格式兼容)
      final response = await http.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': _model,
          'messages': [
            {'role': 'system', 'content': '你是一个专业的北京旅行规划师，回复简洁精准。'},
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 2048, // 限制输出长度，避免浪费 token
          'temperature': 0.8, // 稍高温度增加创意性
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'] as String;
      } else {
        return '生成失败 (${response.statusCode})，请重试。\n생성에 실패했습니다. 다시 시도해주세요.';
      }
    } catch (e) {
      return '网络错误：$e\n네트워크 오류가 발생했습니다.';
    }
  }
}
