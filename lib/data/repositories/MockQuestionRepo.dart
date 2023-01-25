import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';


class MockQuestionRepo implements IQuestionRepo {
  Future<String> getQuestionAsync() async {
    String textasset = "text/json.txt"; //path to text file asset
    String text = await rootBundle.loadString(textasset);
    print(text);
    return text;
  }

  @override
  List<Question> getQuestion() {
    return [
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1280px-Flag_of_Germany.svg.png","QuestionType.IMAGE", {"Allemagne": true,"Croatie": false,"Malte": false,"Lituanie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/1280px-Flag_of_Austria.svg.png","QuestionType.IMAGE", {"Autriche": true,"Pologne": false,"Pays-Bas": false,"Irlande": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/1280px-Flag_of_Belgium.svg.png","QuestionType.IMAGE", {"Belgique": true,"Croatie": false,"Danemark": false,"Autriche": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Bulgaria.svg/1280px-Flag_of_Bulgaria.svg.png","QuestionType.IMAGE", {"Bulgarie": true,"Luxembourg": false,"Pologne": false,"Allemagne": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Cyprus.svg/1280px-Flag_of_Cyprus.svg.png","QuestionType.IMAGE", {"Chypre": true,"Pays-Bas": false,"Slovaquie": false,"Grèce": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/1280px-Flag_of_Croatia.svg.png","QuestionType.IMAGE", {"Croatie": true,"Pologne": false,"Lituanie": false,"Bulgarie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/1280px-Flag_of_Denmark.svg.png","QuestionType.IMAGE", {"Danemark": true,"Bulgarie": false,"Pologne": false,"Lettonie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Flag_of_Spain.svg/1280px-Flag_of_Spain.svg.png","QuestionType.IMAGE", {"Espagne": true,"Hongrie": false,"Pays-Bas": false,"Grèce": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Estonia.svg/1280px-Flag_of_Estonia.svg.png","QuestionType.IMAGE", {"Estonie": true,"Chypre": false,"Luxembourg": false,"France": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/1280px-Flag_of_Finland.svg.png","QuestionType.IMAGE", {"Finlande": true,"Chypre": false,"Lettonie": false,"Slovaquie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png","QuestionType.IMAGE", {"France": true,"Grèce": false,"Pays-Bas": false,"Slovaquie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/1280px-Flag_of_Greece.svg.png","QuestionType.IMAGE", {"Grèce": true,"Belgique": false,"Hongrie": false,"Croatie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/1280px-Flag_of_Hungary.svg.png","QuestionType.IMAGE", {"Hongrie": true,"Bulgarie": false,"Pays-Bas": false,"Roumanie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Flag_of_Ireland.svg/1920px-Flag_of_Ireland.svg.png","QuestionType.IMAGE", {"Irlande": true,"Autriche": false,"France": false,"Lituanie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/1280px-Flag_of_Italy.svg.png","QuestionType.IMAGE", {"Italie": true,"Hongrie": false,"Portugal": false,"Roumanie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Latvia.svg/1280px-Flag_of_Latvia.svg.png","QuestionType.IMAGE", {"Lettonie": true,"Lituanie": false,"Pays-Bas": false,"Roumanie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Lithuania.svg/1280px-Flag_of_Lithuania.svg.png","QuestionType.IMAGE", {"Lituanie": true,"Lettonie": false,"Portugal": false,"Danemark": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flag_of_Luxembourg.svg/1280px-Flag_of_Luxembourg.svg.png","QuestionType.IMAGE", {"Luxembourg": true,"Belgique": false,"Pays-Bas": false,"Allemagne": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Malta.svg/1280px-Flag_of_Malta.svg.png","QuestionType.IMAGE", {"Malte": true,"Estonie": false,"Danemark": false,"Allemagne": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/1280px-Flag_of_the_Netherlands.svg.png","QuestionType.IMAGE", {"Pays-Bas": true,"Luxembourg": false,"Slovaquie": false,"Slovénie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/1/12/Flag_of_Poland.svg/1280px-Flag_of_Poland.svg.png","QuestionType.IMAGE", {"Pologne": true,"Estonie": false,"Lituanie": false,"Portugal": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png","QuestionType.IMAGE", {"Portugal": true,"Slovénie": false,"Lituanie": false,"Slovaquie": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_Czech_Republic.svg/1280px-Flag_of_the_Czech_Republic.svg.png","QuestionType.IMAGE", {"République tchèque": true,"Malte": false,"Danemark": false,"Autriche": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Romania.svg/1280px-Flag_of_Romania.svg.png","QuestionType.IMAGE", {"Roumanie": true,"Malte": false,"Grèce": false,"Chypre": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Slovakia.svg/1280px-Flag_of_Slovakia.svg.png","QuestionType.IMAGE", {"Slovaquie": true,"Bulgarie": false,"Croatie": false,"Pologne": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Slovenia.svg/1280px-Flag_of_Slovenia.svg.png","QuestionType.IMAGE", {"Slovénie": true,"Slovaquie": false,"Danemark": false,"Chypre": false}),
      Question("Quel pays?","https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Flag_of_Sweden.svg/1280px-Flag_of_Sweden.svg.png","QuestionType.IMAGE", {"Suède": true,"Italie": false,"République tchèque": false,"Belgique": false})
    ];
  }
}
