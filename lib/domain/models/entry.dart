import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Entry {
  @primaryKey
  int id;
  String name;
  String image;
  String description;
  String commonLocations;
  String category;

  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocations,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'commonLocations': commonLocations,
      'category': category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      commonLocations:
          jsonEncode(map['common_location'] ?? ['Sem Localização']),
      category: map['category'] ?? '',
    );
  }

  List<String> commonLocationsConverter() {
    return (jsonDecode(commonLocations) as List<dynamic>)
        .map((e) => e as String)
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source));
}
