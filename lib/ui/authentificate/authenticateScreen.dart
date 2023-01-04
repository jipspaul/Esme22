import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Mot de passe',
            ),
            obscureText: true,
          ),
          ElevatedButton(
            child: Text('login', style: TextStyle(fontSize: 20)),
            onPressed: signIn,
          ),
        ]),
      ),
    );
  }
//Navigator.pushNamed(context, "/");
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
