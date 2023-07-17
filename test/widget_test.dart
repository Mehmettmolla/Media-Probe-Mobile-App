import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_mobile_app/main.dart';
import 'package:media_probe_mobile_app/view/news_detail/news_detail_view.dart';
import 'package:media_probe_mobile_app/widgets/card/custom_news_card.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  testWidgets('News list page displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.byType(CustomNewsCard), findsWidgets);

    await tester.pumpAndSettle();

    expect(find.byType(CustomNewsCard), findsWidgets);

    await tester.tap(find.byType(CustomNewsCard).first);
    await tester.pumpAndSettle();

    expect(find.byType(NewsDetailView), findsOneWidget);
  });
}
