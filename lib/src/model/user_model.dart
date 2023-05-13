// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/user_model.freezed.dart';
part 'json_serializable_generator/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String nome,
    required String senha,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
