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
      switch (e.code) {
        case 'user-not-found':
          throw Exception('Email tidak ditemukan.');
        case 'wrong-password':
          throw Exception('Password salah.');
        case 'invalid-email':
          throw Exception('Format email tidak valid.');
        case 'user-disabled':
          throw Exception('Akun dinonaktifkan.');
        case 'too-many-requests':
          throw Exception('Terlalu banyak percobaan. Coba lagi nanti.');
        case 'email-already-in-use':
          throw Exception('Akun sudah digunakan.');
        case 'weak-password':
          throw Exception('Password terlalu lemah.');
        default:
          throw Exception('Login gagal: ${e.message}');
      }
    } catch (e) {
      throw Exception('Authentication failed: ${e.toString()}');
    }
  }
}
