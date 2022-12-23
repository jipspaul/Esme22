import 'package:flutter_application_1/data/models/ListQuestions.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/QuestionUseCase.dart';

class QuestionManager {
  late List<Question> _questions;
  int? _index; //current question index
  int? _score = 0;
  bool isPartyFinish = false;

  QuestionManager() {
    IQuestionRepo questionRepo = MockQuestionRepo();

    _questions = questionRepo.getQuestion();
    print(ListQuestions(_questions).toJson().entries);
    _index = 0;
    _score = 0;
  }

  Question getCurrentQuestion() {
    return _questions[_index!];
  }
  int getlenght() {
    return _questions.length;
  }
  bool submitResponse(String response) {
    bool isCorrect =
        QuestionUseCase().isCorrectAnswer(getCurrentQuestion(), response)!;

    if (isCorrect) {
      _score = _score! + 1;
      if (_index! < _questions.length - 1) {
        _index = _index! + 1;
      } else {
        isPartyFinish = true;
      }

      return true;
    } else {
      return false;
    }
  }

  String getScore() {
    return _score.toString();
  }
}