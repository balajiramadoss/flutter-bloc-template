// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) =>
    QuoteResponse(
      sentence: json['sentence'] as String?,
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'character': instance.character?.toJson(),
    };

Character _$CharacterFromJson(Map<String, dynamic> json) =>
    Character()..name = json['name'] as String?;

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
    };
