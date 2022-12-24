import 'package:json_annotation/json_annotation.dart';

part 'Question.g.dart';

@JsonSerializable()
class Question {
  final String question; //ex: Which country?
  final data;
  final String type;
  final Map<String, bool> responses;

  Question(this.question, this.data, this.type, this.responses);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'Question{question: $question, data: $data, type: $type, responses: $responses}';
  }
}


//enum QuestionType { IMAGE, TEXT, AUDIO, VIDEO }