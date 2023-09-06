import 'package:json_annotation/json_annotation.dart';
import 'package:starter/data/models/user.model.dart';

part 'user.response.g.dart';

///
/// [User]
///
@JsonSerializable(fieldRename: FieldRename.snake)
class UserResponse {

  ///
  @JsonKey(name: 'data')
  User? user;

  ///
  UserResponse({this.user});

  ///
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  ///
  Map<String, dynamic> toJson() {
    return _$UserResponseToJson(this);
  }
}
