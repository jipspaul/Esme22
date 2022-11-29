
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';

import '../data/repositories/MockQuestionRepo.dart';

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
