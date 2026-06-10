import 'package:flutter_test/flutter_test.dart';
import 'package:beijing_hometown/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const BeijingApp());
    // 验证页面标题存在
    expect(find.text('北京'), findsOneWidget);
    expect(find.text('BEIJING · 我的家乡'), findsOneWidget);
  });
}
