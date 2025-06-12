part of 'user_cubit_cubit.dart';

@immutable
sealed class UserCubitState {}

final class UserCubitLoaded extends UserCubitState {}

final class UserCubitSuccesState extends UserCubitState {
  final User? user;

  UserCubitSuccesState(this.user);
}

final class UserErrorState extends UserCubitState {
  final String? message;

  UserErrorState(this.message);
}
