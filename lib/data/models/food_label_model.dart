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

  const FoodLabel({
    this.energy = 0,
    this.fat = 0,
    this.saturated = 0,
    this.protein = 0,
    this.salt = 0,
    this.sugar = 0,
    this.carbohydrates = 0,
  });

  FoodLabel copyWith({
    num? energy,
    num? fat,
    num? saturated,
    num? protein,
    num? salt,
    num? sugar,
    num? carbohydrates,
  }) {
    return FoodLabel(
      energy: energy ?? this.energy,
      fat: fat ?? this.fat,
      saturated: saturated ?? this.saturated,
      protein: protein ?? this.protein,
      salt: salt ?? this.salt,
      sugar: sugar ?? this.sugar,
      carbohydrates: carbohydrates ?? this.carbohydrates,
    );
  }

  FoodLabel operator +(FoodLabel other) {
    return FoodLabel(
      energy: energy + other.energy,
      fat: fat + other.fat,
      saturated: saturated + other.saturated,
      protein: protein + other.protein,
      salt: salt + other.salt,
      sugar: sugar + other.sugar,
      carbohydrates: carbohydrates + other.carbohydrates,
    );
  }

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
}
