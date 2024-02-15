// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

class ServiceModel {
  String name;
  String id;
  String price;
  String desc;
  List<String?> documetsRequired;
  List<String?> types;
  ServiceModel({
    required this.name,
    required this.id,
    required this.price,
    required this.desc,
    required this.documetsRequired,
    required this.types,
  });

  ServiceModel copyWith({
    String? name,
    String? id,
    String? price,
    List<String>? documetsRequired,
    List<String>? types,
  }) {
    return ServiceModel(
      name: name ?? this.name,
      id: id ?? this.id,
      price: price ?? this.price,
      desc: desc,
      documetsRequired: documetsRequired ?? this.documetsRequired,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'price': price,
      'desc': desc,
      'documetsRequired': documetsRequired,
      'types': types,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return ServiceModel(
      name: map['name'] as String,
      id: map['id'] as String,
      price: map['price'] as String,
      desc: map['desc'] as String,
      documetsRequired: List<String?>.from(
        (map['documetsRequired'] as List<String?>),
      ),
      types: List<String?>.from(
        (map['types'] as List<String?>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceModel(name: $name, id: $id, price: $price, documetsRequired: $documetsRequired, types: $types)';
  }

  @override
  bool operator ==(covariant ServiceModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.price == price &&
        listEquals(other.documetsRequired, documetsRequired) &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        price.hashCode ^
        documetsRequired.hashCode ^
        types.hashCode;
  }
}
