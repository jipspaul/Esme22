import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
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
  MockQuizzNotification notifications = MockQuizzNotification();
  List<CheckBoxStateManagerSendQuizz> notifications2 =
      MockQuizzNotification().getlistenotification();
  List<String> listequestionselectionner = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envoiedequizz'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text("Envoie d'un quizz",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
            Divider(color: Colors.blue),
            Text(
                "Sélectionne les questions que tu souhaites envoyer et appuie sur le bouton 'Sauvegarder'.",
                textAlign: TextAlign.left),
            Divider(color: Colors.blue),
            ElevatedButton(
              child: Text('disconect', style: TextStyle(fontSize: 20)),
              onPressed: () { FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/");
              }
            ),
            ElevatedButton(
              child: Text('Sauvegarder', style: TextStyle(fontSize: 20)),
              onPressed: (listequestionselectionner.length > 0)
                  ? () {
                      //if buttonenabled == true then pass a function otherwise pass "null"
                      print("Elevated Button One pressed");
                      List<Question> listequestionchoisit = MockQuizzNotification().getlistechoit(listequestionselectionner);
                      print(listequestionchoisit);
                      Navigator.pushNamed(context, "/");
              }
                  : null,
            ),
            Text(
                "il y a " +
                    listequestionselectionner.length.toString() +
                    " quizz selectionné",
                textAlign: TextAlign.left),
            Divider(color: Colors.blue),
            buildgroupCheckbox(allcheckbox),
            Divider(color: Colors.blue),
            ...notifications2.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxStateManagerSendQuizz checkBox) =>
      CheckboxListTile(
        value: checkBox.value,
        title: Text(checkBox.title, style: TextStyle(fontSize: 20)),
        onChanged: (value) => setState(() {
          checkBox.value = value!;
          if (checkBox.value == true) {
            listequestionselectionner.add(checkBox.title);
          } else {
            listequestionselectionner.remove(checkBox.title);
          }
          print(listequestionselectionner);
          allcheckbox.value =
              notifications2.every((element) => element.value == true);
        }),
      );

  Widget buildgroupCheckbox(CheckBoxStateManagerSendQuizz checkBox) =>
      CheckboxListTile(
        value: checkBox.value,
        title: Text(checkBox.title, style: TextStyle(fontSize: 20)),
        onChanged: toggleGroupChexbox,
      );

  void toggleGroupChexbox(bool? value) {
    if (value == null) return;
    setState(() {
      allcheckbox.value = value;
      notifications2.forEach((element) => element.value = value);
      if (allcheckbox.value == true) {
        listequestionselectionner.clear();
        notifications2
            .forEach((element) => listequestionselectionner.add(element.title));
      } else {
        listequestionselectionner.clear();
      }
      print(listequestionselectionner);
    });
  }
}
