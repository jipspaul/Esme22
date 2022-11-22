// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['question'] as String,
      json['data'],
      json['type'] as String,
      Map<String, bool>.from(json['responses'] as Map),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'data': instance.data,
      'type': instance.type,
      'responses': instance.responses,
    };
