import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/models/food_label_model.dart';
import 'package:fit_fit_meal/data/repository/activity_repository/activity_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository _activityRepository;
  ActivityBloc({ActivityRepository? activityRepository})
      : _activityRepository = activityRepository ?? ActivityRepository(),
        super(ActivityInitial()) {
    on<UpdateStats>(_updateStats);
  }

  FutureOr<void> _updateStats(
      UpdateStats event, Emitter<ActivityState> emit) async {
    try {
      emit(UpdatigStats());
      await _activityRepository.updateStats(event.label);
      await _activityRepository.updateDay();
      emit(StatsUpdated());
    } catch (error) {
      emit(ActivityError(error: error.toString()));
    }
  }
}
