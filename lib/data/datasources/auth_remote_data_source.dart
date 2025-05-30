class AuthRemoteDataSource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return email == "test" && password == "test";
  }

  Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}