import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<bool> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<bool> register(String email, String password) {
    return remote.register(email, password);
  }
}
