part of repository;

extension AuthenticationRepository on Repository {
  Future<Either<Failure, String>> getToken() {
    return convertToEither<String>(
        () => d.authenticationDataSource.getToken());
  }

  Future<Either<Failure, void>> setToken(String token) {
    return convertToEither<void>(
        () => d.authenticationDataSource.saveToken(token));
  }

  Future<Either<Failure, bool>> hasToken() {
    return convertToEither<bool>(
        () => d.authenticationDataSource.hasToken());
  }

  Future<Either<Failure, bool>> clearToken() {
    return convertToEither<bool>(
        () => d.authenticationDataSource.clearToken());
  }
}
