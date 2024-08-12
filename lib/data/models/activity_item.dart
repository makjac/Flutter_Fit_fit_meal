// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ActivityItem extends Equatable {
  final String lottiePath;
  final String label;
  final double value;

  const ActivityItem({
    required this.lottiePath,
    required this.label,
    required this.value,
  });

  ActivityItem copyWith(
    String? lottiePath,
    String? label,
    double? value,
  ) {
    return ActivityItem(
      lottiePath: lottiePath ?? this.lottiePath,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
        lottiePath,
        label,
        value,
      ];
}
