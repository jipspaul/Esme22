import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/ListQuestions.dart';
import 'package:flutter_application_1/data/models/Question.dart';

class receptionquizzScreen extends StatefulWidget {
  @override
  _receptionquizzScreenState createState() => _receptionquizzScreenState();
}

class _receptionquizzScreenState extends State<receptionquizzScreen> {
  List<DocumentSnapshot> quizzList = [];

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser!;
    String? emailentrer = currentUser.email;
    getQuizzByEmail(emailentrer!).then((value) {
      setState(() {
        quizzList = value;
      });
    });
  }

  Future<List<DocumentSnapshot>> getQuizzByEmail(String emailentrer) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quizz_envoyer')
        .where('a', isEqualTo: emailentrer)
        .get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textSize = size.width / 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receptiondequizz'),
      ),
      body: Center(
        child: quizzList != null
            ? ListView.builder(
                itemCount: quizzList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[

                      Text(
                        'Quizz ${index + 1} : de ${quizzList[index]['de']}',
                        style: TextStyle(fontSize: textSize),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                                ElevatedButton(
                                  child: Text('Supprimer'),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('quizz_envoyer')
                                        .doc(quizzList[index].id)
                                        .delete();
                                    setState(() {
                                      quizzList.removeAt(index);
                                    });
                                  },
                                ),
                          VerticalDivider(),
                                ElevatedButton(
                                  onPressed: () {
                                    // Code pour lancer le quizz
                                    var jsonString = quizzList[index]['quoi'];
                                    var jsonData = jsonDecode(jsonString);
                                    ListQuestions listQuestions = ListQuestions.fromJson(jsonData);
                                    List<Question> listQuestions_liste =listQuestions.questionsList;
                                    Navigator.pushNamed(context, '/DoQuizzScreen', arguments: listQuestions_liste);
                                    /*for (var question in listQuestions_liste) {
                                      print("Question : ${question.question}");
                                      print("Data : ${question.data}");
                                      print("Type : ${question.type}");
                                      print("Responses : ${question.responses}");
                                    }*/

                                  },
                                  child: Text("C'est parti"),
                                ),
                              ],
                            ),
                      Divider(color: Colors.blue),
                    ],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
