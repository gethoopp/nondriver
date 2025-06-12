part of 'chinesee_food_cubit_cubit.dart';

@immutable
sealed class ChineseeFoodCubitState {}

final class ChineseeFoodCubitLoaded extends ChineseeFoodCubitState {}

final class ChineseeFoodCubitSuccesState extends ChineseeFoodCubitState {
  final dynamic chineseListfood;
  ChineseeFoodCubitSuccesState(this.chineseListfood);
}

final class ChineseeFoodErrorState extends ChineseeFoodCubitState {
  final String? message;

  ChineseeFoodErrorState(this.message);
}
