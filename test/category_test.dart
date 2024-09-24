import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyrule/screens/components/category.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/const/categories.dart';

void main() {
  testWidgets('Category widget displays correctly',
      (WidgetTester tester) async {
    const testCategory = 'testCategory';
    categories[testCategory] = 'Test Category';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Category(category: testCategory),
        ),
      ),
    );

    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the text is displayed
    expect(find.text('Test Category'), findsOneWidget);
  });

  testWidgets('Category widget navigates to Results on tap',
      (WidgetTester tester) async {
    const testCategory = 'testCategory';
    categories[testCategory] = 'Test Category';

    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: Category(category: testCategory),
        ),
        routes: {
          '/results': (context) => Results(category: testCategory),
        },
      ),
    );

    // Tap the InkWell
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    // Verify that the Results screen is displayed
    expect(find.byType(Results), findsOneWidget);
  });
}
