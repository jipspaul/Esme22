import 'package:json_annotation/json_annotation.dart';

import 'Question.dart';

part 'ListQuestions.g.dart';

@JsonSerializable()
class ListQuestions {
  List<Question> questionsList;
  ListQuestions(this.questionsList);

  factory ListQuestions.fromJson(Map<String, dynamic> json) => _$ListQuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$ListQuestionsToJson(this);
}
