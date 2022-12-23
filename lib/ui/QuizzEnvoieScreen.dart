import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/CheckBoxStateManagerSendQuizz.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';
import 'package:flutter_application_1/data/repositories/MockQuizzNotification.dart';
class QuizzEnvoieScreen extends StatefulWidget {
  @override
  State<QuizzEnvoieScreen> createState() => _QuizzEnvoieScreenState();
}

class _QuizzEnvoieScreenState extends State<QuizzEnvoieScreen> {
  QuestionManager questionManager = QuestionManager();
  MockQuizzNotification notifications=MockQuizzNotification();

  List<CheckBoxStateManagerSendQuizz> notifications2 = MockQuizzNotification().getlistenotification();
  /*final notifications = [
    CheckBoxStateManagerSendQuizz(title: 'france'),
    CheckBoxStateManagerSendQuizz(title: 'suisse'),
  ];*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Envoiedequizz'),
      ),
      body: Center(
        child: Column(
          children: [

            ...notifications2.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxStateManagerSendQuizz checkBox) => CheckboxListTile(
        value: checkBox.value,
        title: Text(checkBox.title, style: TextStyle(fontSize: 20)),
        onChanged: (value) => setState(() => checkBox.value = value!),
      );

}