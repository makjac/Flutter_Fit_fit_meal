import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_fit_meal/data/repository/firbase/aurh_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(AuthInitial()) {
    on<SignIn>(_signIn);
    on<SignUp>(_signUp);
    on<SignOut>(_signOut);
    on<RefreshPassword>(_refreshPassword);
  }

  FutureOr<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      emit(LogginIn());
      await _authRepository.signIn(email: event.email, passwd: event.password);
      emit(LoggedIn());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _signUp(SignUp event, Emitter<AuthState> emit) async {
    try {
      emit(CreatingAccount());
      _authRepository.signIn(email: event.email, passwd: event.password);
      emit(AccountCreated());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _refreshPassword(
      RefreshPassword event, Emitter<AuthState> emit) async {
    try {
      emit(SendingRefreshEmail());
      _authRepository.resetPasswd(email: event.email);
      emit(RefreshEmailSend());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      emit(SigningOut());
      await _authRepository.signOut();
      emit(SignedOut());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }
}
