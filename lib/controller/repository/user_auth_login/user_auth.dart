import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ondriver/controller/repository/user_auth_login/base_user_auth.dart';

class GetUserAuth implements BaseUserAuthRepository {
  final dio = Dio();
  @override
  Future<User?> loginUserAuth(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception('Authentication failed: ${e.toString()}');
    }
    return null;
  }
}
