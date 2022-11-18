// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class UpdatigStats extends ActivityState {}

class StatsUpdated extends ActivityState {}

class ActivityError extends ActivityState {
  final String error;

  const ActivityError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
