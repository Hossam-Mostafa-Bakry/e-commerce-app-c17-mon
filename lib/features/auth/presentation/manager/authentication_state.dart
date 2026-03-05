part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

final class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationSignInLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationSignInSuccessState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

final class AuthenticationSignInErrorState extends AuthenticationState {
  @override
  List<Object> get props => [];
}