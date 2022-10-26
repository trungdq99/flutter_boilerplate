// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: 'id', includeIfNull: false) int? id,
    @JsonKey(name: 'username', includeIfNull: false) String? username,
    @JsonKey(name: 'password', includeIfNull: false) String? password,
    @JsonKey(name: 'fullname', includeIfNull: false) String? fullname,
    @JsonKey(name: 'age', includeIfNull: false) int? age,
    @JsonKey(name: 'country', includeIfNull: false) String? country,
    @JsonKey(name: 'twitterAccount', includeIfNull: false)
        String? twitterAccount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
