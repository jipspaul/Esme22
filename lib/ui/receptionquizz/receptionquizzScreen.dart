import 'package:flutter/material.dart';

class receptionquizzScreen extends StatefulWidget {
  @override
  State<receptionquizzScreen> createState() => _receptionquizzScreenState();
}

class _receptionquizzScreenState extends State<receptionquizzScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envoiedequizz'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text("recevoir un quizz",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
            Divider(color: Colors.blue),
            Text(
                "Voici les quizz que vos amis souhaite que tu fasses. clic sur l'un deux pour lancer le quizz",
                textAlign: TextAlign.left),
            ElevatedButton(
              child: Text('Sauvegarder', style: TextStyle(fontSize: 20)),
              onPressed:  () {              }
            ),

            Divider(color: Colors.blue),

          ],
        ),
      ),
    );
  }


}
