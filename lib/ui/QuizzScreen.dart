import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';

class QuizzScreen extends StatefulWidget {
  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  QuestionManager questionManager = QuestionManager();

  @override
  Widget build(BuildContext context) {
    Question question = questionManager.getCurrentQuestion();

    return questionManager.isPartyFinish
        ? partyFinishScreen(questionManager.getScore())
        : Scaffold(
            appBar: AppBar(
              title: const Text('QUIZZ'),
            ),
            body: Center(
                child: Column(
              children: [
                Flexible(child: Text("${questionManager.getScore()}")),
                Flexible(
                    flex: 1,
                    child: Text(
                      question.question,
                      style: TextStyle(fontSize: 50),
                    )),
                Flexible(flex: 1, child: Image.network(question.data)),
                Flexible(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: question.responses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                              onPressed: () {
                                questionManager.submitResponse(
                                    question.responses.keys.elementAt(index));
                                setState(() {});
                              },
                              child: Text(
                                  question.responses.keys.elementAt(index)));
                        }))
              ],
            )),
          );
  }

  Widget partyFinishScreen(String score) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("FINISH score: $score"),
      ),
    );
  }
}
