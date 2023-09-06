import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

///
/// THE TYPE_ID SHOULD BE 0 TO 299
///
@HiveType(typeId: 0)
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  ///
  /// id
  ///
  @HiveField(0)
  int? id;

  ///
  /// first name
  ///
  @HiveField(1)
  String? firstName;

  ///
  /// seocnd name
  ///
  @HiveField(2)
  String? lastName;

  ///
  /// Email
  ///
  @HiveField(3)
  String? email;

  ///
  User({this.id, this.firstName, this.lastName, this.email});

  ///
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  ///
  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  @override
  String toString() {
    return 'id: $id , firstName : $firstName , lastName : $lastName , email: $email';
  }
}
