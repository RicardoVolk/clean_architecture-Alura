import 'package:flutter_test/flutter_test.dart';
import 'package:hyrule/controllers/api_controller.dart';
import 'package:hyrule/data/api/data_api.dart';
import 'package:mockito/mockito.dart';

// Mock class for DataApi
class MockDataApi extends Mock implements DataApi {}

void main() {
  group('ApiController', () {
    late ApiController apiController;
    late MockDataApi mockDataApi;

    setUp(() {
      mockDataApi = MockDataApi();
      apiController = ApiController();
    });

    test('getEntriesByCategory throws exception when DataApi fails', () async {
      // Arrange
      const category = 'testCategory';
      when(mockDataApi.getEntriesByCategory(category: category))
          .thenThrow(Exception('Failed to load entries'));

      // Act & Assert
      expect(() => apiController.getEntriesByCategory(category: category),
          throwsException);
      verify(mockDataApi.getEntriesByCategory(category: category)).called(1);
    });
  });
}
