import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
