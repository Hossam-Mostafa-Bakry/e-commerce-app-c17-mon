part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

final class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationSuccessState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationErrorState extends AuthenticationState {
  final String exception;

  const AuthenticationErrorState(this.exception);

  @override
  List<Object> get props => [];
}
