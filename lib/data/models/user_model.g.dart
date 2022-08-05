// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      fullname: json['fullname'] as String?,
      age: json['age'] as int?,
      country: json['country'] as String?,
      twitterAccount: json['twitterAccount'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('fullname', instance.fullname);
  writeNotNull('age', instance.age);
  writeNotNull('country', instance.country);
  writeNotNull('twitterAccount', instance.twitterAccount);
  return val;
}
