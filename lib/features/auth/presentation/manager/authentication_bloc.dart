import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEventSignIn>(_onAuthenticationEventSignIn);
  }

  FutureOr<void> _onAuthenticationEventSignIn(
    AuthenticationEventSignIn event,
    Emitter<AuthenticationState> emit,
  ) {
    /// Business Logic
    emit(AuthenticationSignInLoadingState());

    try {

      event._data;

      emit(AuthenticationSignInSuccessState());
    } catch (e) {
      emit(AuthenticationSignInErrorState());
    }
  }
}
