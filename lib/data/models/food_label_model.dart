import 'dart:convert';

import 'package:equatable/equatable.dart';

class FoodLabel extends Equatable {
  num energy;
  num fat;
  num saturated;
  num protein;
  num salt;
  num sugar;
  num carbohydrates;

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

  FoodLabel operator +(FoodLabel label) => FoodLabel(
        energy: energy + label.energy,
        fat: fat + label.fat,
        saturated: saturated + label.saturated,
        protein: protein + label.protein,
        salt: salt + label.salt,
        sugar: sugar + label.sugar,
        carbohydrates: carbohydrates + label.carbohydrates,
      );

  FoodLabel({
    required this.energy,
    required this.fat,
    required this.saturated,
    required this.protein,
    required this.salt,
    required this.sugar,
    required this.carbohydrates,
  });
}
