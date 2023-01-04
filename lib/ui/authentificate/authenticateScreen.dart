import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification'),
      ),
      body: Center(
        child: ListView(children: [
          Text("Authentification",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Mot de passe',
            ),
            obscureText: true,
          ),
          ElevatedButton(
            child: Text('login', style: TextStyle(fontSize: 20)),
            onPressed: (){},
          ),

        ]),
      ),
    );
  }
}
