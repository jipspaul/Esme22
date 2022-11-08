import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/QuestionUseCase.dart';

class QuestionManager {
  List<Question> _questions;
  int _index; //current question index
  int _score;

  QuestionManager() {
    IQuestionRepo questionRepo = MockQuestionRepo();

    _questions = questionRepo.getQuestion();
    _index = 0;
    _score = 0;
  }

  Question getCurrentQuestion() {
    return _questions[_index];
  }

  bool submitResponse(String response) {
    bool isCorrect =
        QuestionUseCase().isCorrectAnswer(getCurrentQuestion(), response);

    if (isCorrect) {
      _score++;
      _index++;
      return true;
    } else {
      return false;
    }
  }
}
