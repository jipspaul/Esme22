import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/CheckBoxStateManagerSendQuizz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';

class MockQuizzNotification{
  @override
  QuestionManager questionManager = QuestionManager();
  List<CheckBoxStateManagerSendQuizz> listenotification=[];



  List<CheckBoxStateManagerSendQuizz> getlistenotification(){
    List<Question> listequestion=questionManager.getlistequestion();
    for (var question in listequestion){
      String bonnereponse=question.responses.keys.elementAt(1);
      listenotification.add(CheckBoxStateManagerSendQuizz(title: bonnereponse));
    }
    return listenotification;
  }

}
