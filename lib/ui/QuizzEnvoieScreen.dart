import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';
import 'package:flutter_application_1/data/repositories/IQuestionRepo.dart';

class QuizzEnvoieScreen extends StatefulWidget {
  @override
  State<QuizzEnvoieScreen> createState() => _QuizzEnvoieScreenState();
}

class _QuizzEnvoieScreenState extends State<QuizzEnvoieScreen> {
  QuestionManager questionManager = QuestionManager();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Question question = questionManager.getCurrentQuestion();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envoiedequizz'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Save the text in the text fields
              },
              child: Text("Save"),
            ),
            Divider(
              height: 50,
              color: Colors.blue,
              thickness: 5,
            ),
            Flexible(
                flex: 2,
                child: ListView.builder(
                    itemCount: questionManager.getlenght(),
                    itemBuilder: (BuildContext context, int index) {
                      return Checkbox(
                        value: false,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
