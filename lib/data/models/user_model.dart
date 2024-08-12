import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';

class UserModel extends Equatable {
  final String uid;
  final String? login;
  final bool? gender;
  final num? weight;
  final num? height;
  final num? age;
  final num? pal;

  const UserModel({
    this.uid = "",
    this.login,
    this.gender,
    this.weight,
    this.height,
    this.age,
    this.pal,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>?;

    return UserModel(
      uid: snap.id,
      login: data?['login'] as String? ?? "",
      gender: data?['gender'] as bool? ?? true,
      weight: data?['weight'] as num? ?? 0,
      height: data?['height'] as num? ?? 0,
      age: data?['age'] as num? ?? 0,
      pal: data?['pal'] as num? ?? 0,
    );
  }

  static UserModel fromSharedPreferences() => UserModel(
        uid: UserSharedPreferences.getUserUID() ?? "",
        login: UserSharedPreferences.getUserLogin(),
        gender: UserSharedPreferences.getUserGender(),
        weight: UserSharedPreferences.getUserWeight(),
        height: UserSharedPreferences.getUserHeight(),
        age: UserSharedPreferences.getUserAge(),
        pal: UserSharedPreferences.getUserPAL(),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login ?? "",
      'gender': gender ?? true,
      'weight': weight ?? 0,
      'height': height ?? 0,
      'age': age ?? 0,
      'pal': pal ?? 0,
    };
  }

  UserModel copyWith({
    String? login,
    bool? gender,
    num? weight,
    num? height,
    num? age,
    num? pal,
  }) {
    return UserModel(
      uid: uid,
      login: login ?? this.login,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      pal: pal ?? this.pal,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        uid,
        login,
        gender,
        weight,
        height,
        age,
        pal,
      ];
}
