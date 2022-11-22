import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/ui/QuizzScreen.dart';

import '../data/models/MenuItem.dart';
import '../data/models/Question.dart';

class QuestionUseCase {
  List<Question> getQuestions() {
    IQuestionRepo repo = MockQuestionRepo();
    var menu = repo.getQuestion();
    return menu;
  }

  bool? isCorrectAnswer(Question question, String response) {
    return question.responses[response];
  }
}
