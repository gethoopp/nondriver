part of 'order_data_cubit.dart';

@immutable
sealed class OrderDataState {}

final class OrderDataLoaded extends OrderDataState {}

final class OrderDataSucces extends OrderDataState {
  final List<ChineseeFoodItem> chineseFood;
  OrderDataSucces(this.chineseFood);
}

final class OrderDataError extends OrderDataState {
  final String message;
  OrderDataError(this.message);
}
