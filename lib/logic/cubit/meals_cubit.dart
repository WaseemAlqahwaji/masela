import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(MealsInitial());
}
