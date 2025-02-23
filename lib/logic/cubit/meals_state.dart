part of 'meals_cubit.dart';

sealed class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

final class MealsInitial extends MealsState {}
