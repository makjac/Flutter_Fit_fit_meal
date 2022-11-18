// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class UpdateStats extends ActivityEvent {
  final FoodLabel label;

  const UpdateStats({
    required this.label,
  });

  @override
  List<Object> get props => [label];
}
