   import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String token, String newPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulated remote API response
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(
      id: 'USR-001',
      name: 'Admin User',
      email: email,
      role: 'Administrator',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> forgotPassword(String email) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> resetPassword(String token, String newPassword) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
