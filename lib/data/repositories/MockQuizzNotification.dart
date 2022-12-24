import 'package:flutter_application_1/domain/CheckBoxStateManagerSendQuizz.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';

class MockQuizzNotification{
  @override
  QuestionManager questionManager = QuestionManager();
  List<CheckBoxStateManagerSendQuizz> listenotification=[];

  List<CheckBoxStateManagerSendQuizz> getlistenotification(){
    List<Question> listequestion=questionManager.getlistequestion();
    for (var question in listequestion){
      String bonnereponse=question.responses.keys.elementAt(0);
      listenotification.add(CheckBoxStateManagerSendQuizz(title: bonnereponse));
    }
    return listenotification;
  }

  List<Question> getlistechoit(List<String>listequestionselectionner){
    List<Question> listequestion =questionManager.getlistequestion();
    List<Question> listequestionchoisit =[];
    String bonnereponse;
    for (int i = 0; i < listequestion.length; i++) {
      bonnereponse = listequestion[i].responses.keys.elementAt(0);
      if (listequestionselectionner.contains(bonnereponse)) {
        listequestionchoisit.add(listequestion[i]);
      }
    }
    return listequestionchoisit;
  }

}
