// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:fit_fit_meal/data/models/food_label_model.dart';

class Product extends Equatable {
  final String barcode;
  final String name;
  final String producer;
  final String unit;
  final FoodLabel nutritionalLabelling;

  const Product({
    required this.barcode,
    required this.name,
    required this.producer,
    required this.unit,
    required this.nutritionalLabelling,
  }) : super();

  static Product fromSnapshot(DocumentSnapshot snap) => Product(
        barcode: snap['barcode'] as String,
        name: snap['name'] as String,
        producer: snap['producer'] as String,
        unit: snap['unit'] as String,
        nutritionalLabelling: FoodLabel.fromMap(snap['nutritional_labelling']),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'barcode': barcode,
      'name': name,
      'producer': producer,
      'unit': unit,
      'nutritionalLabelling': nutritionalLabelling.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      barcode: map['barcode'] as String,
      name: map['name'] as String,
      producer: map['producer'] as String,
      unit: map['unit'] as String,
      nutritionalLabelling: FoodLabel.fromMap(
          map['nutritionalLabelling'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      barcode,
      name,
      producer,
      unit,
      nutritionalLabelling,
    ];
  }
}
