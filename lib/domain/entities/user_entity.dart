import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? password;
  final String? fullname;
  final int? age;
  final String? country;
  final String? twitterAccount;
  const UserEntity({
    this.id,
    this.username,
    this.password,
    this.age,
    this.fullname,
    this.country,
    this.twitterAccount,
  });
  factory UserEntity.fromModel(UserModel model) => UserEntity(
        id: model.id,
        username: model.username,
        password: model.password,
        fullname: model.fullname,
        age: model.age,
        country: model.country,
        twitterAccount: model.twitterAccount,
      );

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        fullname,
        age,
        country,
        twitterAccount,
      ];
}
