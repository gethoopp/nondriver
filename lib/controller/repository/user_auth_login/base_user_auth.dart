import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseUserAuthRepository {
  Future<User?> loginUserAuth(String email, String password);
}
