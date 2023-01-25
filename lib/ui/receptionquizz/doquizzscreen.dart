import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';


class DoQuizzScreen extends StatefulWidget {
  @override
  State<DoQuizzScreen> createState() => _DoQuizzScreenState();
}

class _DoQuizzScreenState extends State<DoQuizzScreen> {
  int indexquizzenvoyer=0;
  int scorequizzenvoyer=0;
  bool isPartyFinishenvoyer = false;
  @override
  Widget build(BuildContext context) {
    final List<Question> listQuestions_liste = ModalRoute.of(context)?.settings.arguments as List<Question>;

    Question question = listQuestions_liste[indexquizzenvoyer];

    return isPartyFinishenvoyer
        ? partyFinishScreen(scorequizzenvoyer.toString())
        : Scaffold(
      appBar: AppBar(
        title: const Text('QUIZZ'),
      ),
      body: Center(
          child: Column(
            children: [
              Flexible(child: Text("${scorequizzenvoyer}")),
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
                              bool isCorrect = question.responses[question.responses.keys.elementAt(index)]!;
                              if (isCorrect) {
                                scorequizzenvoyer = scorequizzenvoyer + 1;
                                if (indexquizzenvoyer < listQuestions_liste.length - 1) {
                                  indexquizzenvoyer = indexquizzenvoyer + 1;
                                } else {
                                  isPartyFinishenvoyer = true;
                                }
                              } else {

                              }
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
