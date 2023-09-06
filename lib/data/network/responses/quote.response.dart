import 'package:json_annotation/json_annotation.dart';

part 'quote.response.g.dart';

///
/// [User]
///
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class QuoteResponse {
  ///
  String? sentence;

  ///
  Character? character;

  ///
  QuoteResponse({this.sentence,this.character});

  ///
  factory QuoteResponse.fromJson(Map<String, dynamic> json) {
    return _$QuoteResponseFromJson(json);
  }

  ///
  Map<String, dynamic> toJson() {
    return _$QuoteResponseToJson(this);
  }
}

///
@JsonSerializable()
class Character {

  ///
  String? name;

  ///
  Character();

  ///
  factory Character.fromJson(Map<String, dynamic> json) {
    return _$CharacterFromJson(json);
  }

  ///
  Map<String, dynamic> toJson() {
    return _$CharacterToJson(this);
  }
}
