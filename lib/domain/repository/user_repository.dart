part of repository;

extension UserRepository on Repository {
  Future<Either<Failure, String>> login(String username, String password) {
    return convertToEither<String>(() async {
      return await d.userLocalDataSource.login(username, password);
    });
  }

  Future<Either<Failure, UserEntity>> getUserByToken(String token) {
    return convertToEither<UserEntity>(() async {
      return UserEntity.fromModel(
          await d.userLocalDataSource.getByToken(token));
    });
  }
}
