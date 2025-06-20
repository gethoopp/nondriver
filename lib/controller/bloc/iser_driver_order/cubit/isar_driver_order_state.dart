part of 'isar_driver_order_cubit.dart';

@immutable
sealed class IsarDriverOrderState {}

final class IsarDriverOrderLoaded extends IsarDriverOrderState {}

final class IsarDriverOrderSucces extends IsarDriverOrderState {
  final List<DeliveryStatus> notifList;

  IsarDriverOrderSucces(this.notifList);
}

final class IsarDriverOrderError extends IsarDriverOrderState {
  final String message;
  IsarDriverOrderError(this.message);
}
