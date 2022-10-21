// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuElement extends Equatable {
  final String label;
  final Icon icon;

  const MenuElement({
    required this.label,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        label,
        icon,
      ];
}
