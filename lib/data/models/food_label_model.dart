// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FoodLabel extends Equatable {
  final num energy;
  final num fat;
  final num saturated;
  final num protein;
  final num salt;
  final num sugar;
  final num carbohydrates;

  @override
  List<Object?> get props => [
        energy,
        fat,
        saturated,
        protein,
        salt,
        sugar,
        carbohydrates,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'energy': energy,
      'fat': fat,
      'saturated': saturated,
      'protein': protein,
      'salt': salt,
      'sugar': sugar,
      'carbohydrates': carbohydrates,
    };
  }

  factory FoodLabel.fromMap(Map<String, dynamic> map) {
    return FoodLabel(
      energy: map['energy'] as num,
      fat: map['fat'] as num,
      saturated: map['saturated'] as num,
      protein: map['protein'] as num,
      salt: map['salt'] as num,
      sugar: map['sugar'] as num,
      carbohydrates: map['carbohydrates'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodLabel.fromJson(String source) =>
      FoodLabel.fromMap(json.decode(source) as Map<String, dynamic>);

  const FoodLabel({
    required this.energy,
    required this.fat,
    required this.saturated,
    required this.protein,
    required this.salt,
    required this.sugar,
    required this.carbohydrates,
  });
}
