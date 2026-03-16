part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class GetAllCategoriesEvent extends HomeEvent {
  const GetAllCategoriesEvent();

  @override
  List<Object?> get props => [];
}
