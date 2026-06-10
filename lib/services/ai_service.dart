import 'dart:convert';
import 'package:http/http.dart' as http;

/// DeepSeek AI 服务 — 调用 DeepSeek Chat API 生成旅行行程
class AiService {
  static const _baseUrl = 'https://api.deepseek.com';
  static const _apiKey = 'sk-43306113ac934c809c0515f8bbaef8a7';
  static const _model = 'deepseek-chat';

  /// 根据偏好生成北京旅行行程
  static Future<String> generateItinerary({
    required int days,
    required List<String> interests,
    required String language, // 'zh' or 'ko'
  }) async {
    final langName = language == 'ko' ? '韩语' : '中文';
    final interestText = interests.join('、');

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
      final response = await http.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': _model,
          'messages': [
            {
              'role': 'system',
              'content': '你是一个专业的北京旅行规划师，回复简洁精准。',
            },
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 2048,
          'temperature': 0.8,
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
