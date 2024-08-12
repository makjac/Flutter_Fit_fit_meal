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

  static UserModel fromSnapshot(DocumentSnapshot snap) => UserModel(
        uid: snap.id,
        login: snap.data().toString().contains('login')
            ? snap['login'] as String?
            : "",
        gender: snap.data().toString().contains('gender')
            ? snap['gender'] as bool?
            : true,
        weight: snap.data().toString().contains('weight')
            ? snap['weight'] as num?
            : 0,
        height: snap.data().toString().contains('height')
            ? snap['height'] as num?
            : 0,
        age: snap.data().toString().contains('age') ? snap['age'] as num? : 0,
        pal: snap.data().toString().contains('pal') ? snap['pal'] as num? : 0,
      );

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
