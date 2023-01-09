import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String _errorMessage = ""; // Nouvelle variable d'instance
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLooding =false;

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
      body: Form(
        key: _key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Utilisez le constructeur Column au lieu de ListView
              Text("Authentification",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
                validator: validateEmail,
              ),
              // Mise à jour de _errorMessage lorsque l'utilisateur saisit du texte
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                ),
                validator: validatePassword,
                obscureText: true,
              ),
              Center(
                child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
              ),
              // Mise à jour de _errorMessage lorsque l'utilisateur saisit du texte
              ElevatedButton(
                  child: isLooding ? CircularProgressIndicator(color: Colors.white,) : Text('login', style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    setState(()=>isLooding=true );
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      _errorMessage = "";
                      Navigator.pushNamed(context, "/");
                    } on FirebaseAuthException catch (error) {
                      _errorMessage = error.message!;
                    };

                    setState(()=>isLooding=false);
                  }),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  text: 'no account ? ',
                  children: [
                    TextSpan(
                      text: 'sign up',
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushNamed(context, '/signups');
                      },
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'Email address is required';
    String pattern = r'\w+@\w\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'invalid Email Address format';
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password address is required';

    return null;
  }
}
