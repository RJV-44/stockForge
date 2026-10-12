import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hardware_management_system/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Stock', findRichText: true), findsWidgets);
  });
}
