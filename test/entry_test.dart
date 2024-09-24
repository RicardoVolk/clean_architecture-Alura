import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hyrule/domain/models/entry.dart';

void main() {
  group('Entry Model Tests', () {
    final entry = Entry(
      id: 1,
      name: 'Test Name',
      image: 'test_image.png',
      description: 'Test Description',
      commonLocations: jsonEncode(['Location1', 'Location2']),
      category: 'Test Category',
    );

    test('toMap returns a valid map', () {
      final map = entry.toMap();
      expect(map, {
        'id': 1,
        'name': 'Test Name',
        'image': 'test_image.png',
        'description': 'Test Description',
        'commonLocations': jsonEncode(['Location1', 'Location2']),
        'category': 'Test Category',
      });
    });

    test('fromMap returns a valid Entry object', () {
      final map = {
        'id': 1,
        'name': 'Test Name',
        'image': 'test_image.png',
        'description': 'Test Description',
        'common_locations': ['Location1', 'Location2'],
        'category': 'Test Category',
      };
      final entryFromMap = Entry.fromMap(map);
      expect(entryFromMap.id, 1);
      expect(entryFromMap.name, 'Test Name');
      expect(entryFromMap.image, 'test_image.png');
      expect(entryFromMap.description, 'Test Description');
      expect(
          entryFromMap.commonLocations, jsonEncode(['Location1', 'Location2']));
      expect(entryFromMap.category, 'Test Category');
    });

    test('commonLocationsConverter returns a valid list of locations', () {
      final locations = entry.commonLocationsConverter();
      expect(locations, ['Location1', 'Location2']);
    });

    test('toJson returns a valid JSON string', () {
      final jsonStr = entry.toJson();
      final expectedJson = jsonEncode({
        'id': 1,
        'name': 'Test Name',
        'image': 'test_image.png',
        'description': 'Test Description',
        'commonLocations': jsonEncode(['Location1', 'Location2']),
        'category': 'Test Category',
      });
      expect(jsonStr, expectedJson);
    });

    test('fromJson returns a valid Entry object', () {
      final jsonStr = jsonEncode({
        'id': 1,
        'name': 'Test Name',
        'image': 'test_image.png',
        'description': 'Test Description',
        'commonLocations': jsonEncode(['Location1', 'Location2']),
        'category': 'Test Category',
      });
      final entryFromJson = Entry.fromJson(jsonStr);
      expect(entryFromJson.id, 1);
      expect(entryFromJson.name, 'Test Name');
      expect(entryFromJson.image, 'test_image.png');
      expect(entryFromJson.description, 'Test Description');
      expect(entryFromJson.commonLocations,
          jsonEncode(['Location1', 'Location2']));
      expect(entryFromJson.category, 'Test Category');
    });
  });
}
