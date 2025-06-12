part of 'location_real_user_cubit.dart';

@immutable
sealed class LocationRealUserState {}

final class LocationRealUserLoaded extends LocationRealUserState {}

final class LocationRealUserSucces extends LocationRealUserState {
  final dynamic permissionHandler;
  LocationRealUserSucces(this.permissionHandler);
}

final class LocationRealUserError extends LocationRealUserState {
  final String? message;
  LocationRealUserError(this.message);
}
