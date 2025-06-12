import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseDriverAuthRepository {
  Future<User?> loginDriverAuth(String email, String password);
}
