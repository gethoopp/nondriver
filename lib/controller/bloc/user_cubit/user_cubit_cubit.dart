import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:ondriver/controller/repository/user_auth_login/base_user_auth.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {
  final BaseUserAuthRepository userRepository;
  UserCubitCubit(this.userRepository) : super(UserCubitLoaded());

  Future<User?> loginUser(String email, String password) async {
    try {
      final result = await userRepository.loginUserAuth(email, password);

      if (result != null) {
        emit(UserCubitSuccesState(result));
        return result;
      } else {
        emit(UserErrorState('Login gagal: user tidak ditemukan.'));
      }
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
    return null;
  }
}
