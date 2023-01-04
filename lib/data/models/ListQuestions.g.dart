// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListQuestions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListQuestions _$ListQuestionsFromJson(Map<String, dynamic> json) =>
    ListQuestions(
      (json['questionsList'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ListQuestionsToJson(ListQuestions instance) =>
    <String, dynamic>{
      'questionsList': instance.questionsList,
    };
