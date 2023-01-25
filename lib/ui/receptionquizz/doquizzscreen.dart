import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/Question.dart';
//import 'package:flutter_application_1/data/repositories/MockQuestionRepo.dart';
import 'package:flutter_application_1/domain/QuestionManager.dart';

class DoQuizzScreen extends StatefulWidget {
  @override
  State<DoQuizzScreen> createState() => _DoQuizzScreenState();
}

class _DoQuizzScreenState extends State<DoQuizzScreen> {
  //var t = MockQuestionRepo();
  int indexquizzenvoyer=0;
  int scorequizzenvoyer=0;
  bool isPartyFinishenvoyer = false;
  @override
  Widget build(BuildContext context) {
    final List<Question> listQuestions_liste = ModalRoute.of(context)?.settings.arguments as List<Question>;
    QuestionManager questionManager = QuestionManager(questionsenvoyer: listQuestions_liste);
    Question question = questionManager.getCurrentQuestion();
    print(question);
    //print(t.getQuestionAsync());

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

                              /* print("icicla");
                              print(question.responses.keys.elementAt(index));
                              questionManager.submitResponse(
                                  question.responses.keys.elementAt(index));*/
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
