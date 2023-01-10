import 'package:cloud_firestore/cloud_firestore.dart';
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
  final emailController = TextEditingController();
  String emaildoesntexist = "";
  late bool emailIsValid=false ;
  late bool emailIsCurrentUser=false ;
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
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'destinataire Email'),
              validator: validateEmail,
            ),
            Text(emaildoesntexist, style: TextStyle(color: Colors.red)),
            ElevatedButton(
                child: Text('confirmer email', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  setState((){});
                    // Change the state of some variables here
                  emailIsValid = await checkIfEmailInUse(emailController.text);//vrai
                  final currentUser = FirebaseAuth.instance.currentUser!;
                  emailIsCurrentUser = (currentUser.email != emailController.text);
                  if((emailIsValid==false)||emailIsCurrentUser==false)
                  {
                    emaildoesntexist = "emailinvalide ou E=R";
                  }
                  else{
                    emaildoesntexist = "";
                  }
                  print('testechatgpt');
                  print('emailController.text : '+ emailController.text);
                  print('emailIsValid : ' + emailIsValid.toString());
                  print('currentUser.email : ' + currentUser.email.toString());
                  print('emailIsCurrentUser? : ' + emailIsCurrentUser.toString());
                  print('inverseemailIsCurrentUser? : ' + (!emailIsCurrentUser).toString());
                  print( (listequestionselectionner.length > 0 && emailIsCurrentUser && emailIsValid));
                  print('fin');

                }),
            ElevatedButton(
              child: Text('Envoyer', style: TextStyle(fontSize: 20)),
              onPressed: (listequestionselectionner.length > 0 && emailIsCurrentUser && emailIsValid)
                  ? () async {
                      //if buttonenabled == true then pass a function otherwise pass "null"
                      print("Elevated Button One pressed");
                      List<Question> listequestionchoisit =
                          MockQuizzNotification()
                              .getlistechoit(listequestionselectionner);
                      print(listequestionchoisit);
                      final currentUser = FirebaseAuth.instance.currentUser!;
                      final doc = FirebaseFirestore.instance
                          .collection('quizz_envoyer')
                          .doc('my-id');
                      final json = {
                        'de': currentUser.email,
                        'a': emailController.text,
                        'quoi': listequestionchoisit.toString()
                      };
                      await doc.set(json);
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
    });
  }

  // Returns true if email address is in use.
  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      return true;
    }
  }

  Future<bool> validateEmaildouble(String email) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    if ( email==currentUser.email)
    {
      emaildoesntexist= "vous ne pouvez pas vous envoyer à vous meme le quizz";
      print(emaildoesntexist);
      return false;
    }
    return true;
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'Email address is required';
    String pattern = r'\w+@\w\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'invalid Email Address format';
    return null;
  }
}
