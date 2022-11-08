import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';

import '../models/MenuItem.dart';
import 'IMenuRepo.dart';

class MockQuestionRepo implements IQuestionRepo {
  @override
  List<Question> getQuestion() {
    return [
      Question(
          "Quel pays?",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%2C_2020%E2%80%93present%29.svg/langfr-225px-Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%2C_2020%E2%80%93present%29.svg.png",
          QuestionType.IMAGE, {
        "France": true,
        "Pays-Bas": false,
        "Algérie": false,
        "Belgique": false
      })
    ];
  }
}
