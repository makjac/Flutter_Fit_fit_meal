// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String? login;
  final bool? gender;
  final num? weight;
  final num? height;
  final num? age;
  final num? pal;

  const UserModel({
    required this.uid,
    this.login,
    this.gender,
    this.weight,
    this.height,
    this.age,
    this.pal,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) => UserModel(
        uid: snap.id,
        login: snap['login'] as String?,
        gender: snap['gender'] as bool?,
        weight: snap['weight'] as num?,
        height: snap['height'] as num?,
        age: snap['age'] as num?,
        pal: snap['pal'] as num?,
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
