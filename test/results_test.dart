import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyrule/controllers/api_controller.dart';
import 'package:hyrule/screens/favorites.dart';
import 'package:hyrule/screens/results.dart';
import 'package:mockito/annotations.dart'; // Add this import
import 'package:mockito/mockito.dart';

import 'results_test.mocks.dart';

@GenerateMocks([ApiController])
void main() {
  late MockApiController mockApiController;

  setUp(() {
    mockApiController = MockApiController();
  });

  Widget createWidgetUnderTest(String category) {
    return MaterialApp(
      home: Results(category: category),
    );
  }

  testWidgets(
      'Results screen displays CircularProgressIndicator while waiting for data',
      (WidgetTester tester) async {
    when(mockApiController.getEntriesByCategory(category: anyNamed('category')))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(createWidgetUnderTest('someCategory'));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Favorites button navigates to Favorites screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest('someCategory'));

    await tester.tap(find.byIcon(Icons.bookmark));
    await tester
        .pumpAndSettle(); // Waits for the navigation animation to complete

    expect(find.byType(Favorites), findsOneWidget);
  });
}
