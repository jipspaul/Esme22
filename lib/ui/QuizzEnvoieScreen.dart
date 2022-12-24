import 'package:flutter/material.dart';

import 'package:flutter_application_1/domain/CheckBoxStateManagerSendQuizz.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';
import 'package:flutter_application_1/data/repositories/MockQuizzNotification.dart';
class QuizzEnvoieScreen extends StatefulWidget {
  @override
  State<QuizzEnvoieScreen> createState() => _QuizzEnvoieScreenState();
}

class _QuizzEnvoieScreenState extends State<QuizzEnvoieScreen> {
  QuestionManager questionManager = QuestionManager();
  final allcheckbox = CheckBoxStateManagerSendQuizz(title: 'select all choose');
  MockQuizzNotification notifications=MockQuizzNotification();
  List<CheckBoxStateManagerSendQuizz> notifications2 = MockQuizzNotification().getlistenotification();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Envoiedequizz'),
      ),
      body: Center(
        child: Column(
          children: [
            buildgroupCheckbox(allcheckbox),
            Divider(color: Colors.blue),
            ...notifications2.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxStateManagerSendQuizz checkBox) => CheckboxListTile(
        value: checkBox.value,
        title: Text(checkBox.title, style: TextStyle(fontSize: 20)),
        onChanged: (value) => setState(() {
          checkBox.value = value!;
          allcheckbox.value=
              notifications2.every((element) => element.value == true);
        }),
      );



  Widget buildgroupCheckbox(CheckBoxStateManagerSendQuizz checkBox) => CheckboxListTile(
    value: checkBox.value,
    title: Text(checkBox.title, style: TextStyle(fontSize: 20)),
    onChanged: toggleGroupChexbox,
  );
  void toggleGroupChexbox(bool? value){
    if (value == null)return;
    setState(() {
      allcheckbox.value=value;
      notifications2.forEach((element) => element.value=value);
    });
  }
}