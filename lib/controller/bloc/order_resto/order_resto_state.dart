part of 'order_resto_cubit.dart';

@immutable
sealed class OrderRestoState {}

final class OrderRestoLoaded extends OrderRestoState {}

final class OrderRestoSucces extends OrderRestoState {
  final List<OrderStatus> orderStatus;

  OrderRestoSucces(this.orderStatus);
}

final class OrderRestoError extends OrderRestoState {
  final String message;
  OrderRestoError(this.message);
}
