import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String token, String newPassword);
  Future<User?> getCurrentUser();
}
