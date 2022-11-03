import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/controllers/user_controller.dart';
import 'package:fit_fit_meal/data/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController _userController;

  UserBloc({UserController? userController})
      : _userController = userController ?? UserController(),
        super(UserInitial()) {
    on<LoadUserData>(_load);
    on<UpdateUserData>(_update);
  }

  FutureOr<void> _load(LoadUserData event, Emitter<UserState> emit) async {
    try {} catch (error) {
      emit(UserError(error: error.toString()));
    }
  }

  FutureOr<void> _update(UpdateUserData event, Emitter<UserState> emit) async {
    try {
      emit(UpdatingUserData());
      await _userController.updateUserData(user: event.user);
      emit(UserDataUpdated());
    } catch (error) {
      emit(UserError(error: error.toString()));
    }
  }
}
