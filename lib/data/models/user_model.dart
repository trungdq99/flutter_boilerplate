import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;

  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;

  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;

  @JsonKey(name: 'fullname', includeIfNull: false)
  final String? fullname;

  @JsonKey(name: 'age', includeIfNull: false)
  final int? age;

  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;

  @JsonKey(name: 'twitterAccount', includeIfNull: false)
  final String? twitterAccount;

  const UserModel({
    this.id,
    this.username,
    this.password,
    this.fullname,
    this.age,
    this.country,
    this.twitterAccount,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? password,
    String? fullname,
    int? age,
    String? country,
    String? twitterAccount,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        fullname: fullname ?? this.fullname,
        age: age ?? this.age,
        country: country ?? this.country,
        twitterAccount: twitterAccount ?? this.twitterAccount,
      );

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

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
