import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signups extends StatefulWidget {
  @override
  State<signups> createState() => _signupsState();
}

class _signupsState extends State<signups> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordSameController = TextEditingController();
  late String _errorMessage = ""; // Nouvelle variable d'instance
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLooding = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('inscription'),
      ),
      body: Form(
        key: _key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Utilisez le constructeur Column au lieu de ListView
              Text("inscription",
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
              ),
              TextFormField(
                controller: passwordSameController,
                decoration: InputDecoration(
                  hintText: 'Confirmer Mot de passe',
                ),
                validator: validatePassword,
              ),
              Center(
                child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
              ),
              // Mise à jour de _errorMessage lorsque l'utilisateur saisit du texte
              ElevatedButton(
                  child: isLooding
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text("S'inscrire", style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    setState(() => isLooding = true);
                    if (passwordController.text.trim() ==
                        passwordSameController.text.trim()) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        _errorMessage = "";
                        Navigator.pushNamed(context, "/");
                      } on FirebaseAuthException catch (error) {
                        _errorMessage = error.message!;
                      }
                    } else {
                      _errorMessage =
                          "les deux mot de passe ne sont pas similaire";
                    }
                    setState(() => isLooding = false);
                  })
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
