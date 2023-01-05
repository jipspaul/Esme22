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
              onPressed: () async {
                bool success = await signIn();
                if (success) {
                  // Sign-in was successful
                  Navigator.pushNamed(context, "/");
                  FirebaseAuth.instance.authStateChanges();
                } else {
                  Navigator.pushNamed(context, "/"); // Sign-in failed
                }
              }
              //(signIn ?)(){
              //if buttonenabled == true then pass a function otherwise pass "null"

              //},
              ),
        ]),
      ),
    );
  }

//Navigator.pushNamed(context, "/");
  Future<bool> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      return true;
    } catch (e) {
      return false;
    }
  }
}
