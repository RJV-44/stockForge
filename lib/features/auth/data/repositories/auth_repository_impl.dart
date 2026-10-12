import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  User? _currentUser;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String email, String password) async {
    final userModel = await remoteDataSource.login(email, password);
    _currentUser = userModel;
    return userModel;
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    _currentUser = null;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await remoteDataSource.forgotPassword(email);
  }

  @override
  Future<void> resetPassword(String token, String newPassword) async {
    await remoteDataSource.resetPassword(token, newPassword);
  }

  @override
  Future<User?> getCurrentUser() async {
    return _currentUser;
  }
}
