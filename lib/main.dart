import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/DidYouKnowUseCase.dart';
import 'package:flutter_application_1/domain/MenuUseCase.dart';
import 'package:flutter_application_1/ui/QuizzScreen.dart';
import 'package:flutter_application_1/ui/maps/mapsMobile.dart';
import 'package:flutter_application_1/ui/QuizzEnvoieScreen.dart';
import 'package:flutter_application_1/ui/receptionquizz/receptionquizzScreen.dart';
import 'package:flutter_application_1/ui/authentificate/authenticateScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/quizz': (context) => QuizzScreen(),
        '/maps': (context) => MapSample(),
        '/EnvoyerQuizz': (context) => QuizzEnvoieScreen(),
        '/receptionquizzScreen': (context) => receptionquizzScreen(),
        '/authentification': (context) => Authentification(),
        /*'/authentification' : (context) =>Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
              {
                return QuizzEnvoieScreen();
              }
              else {
                return Authentification();
              }
            },
          ),
        ),*/
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var menu = MenuUseCase().getMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Text(
                  DidYouKnowUseCase().getTodayDidYouKnow(),
                )),
            Flexible(
              flex: 3,
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  // Vérifiez si l'utilisateur est connecté avant d'afficher le bouton
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: menu.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, menu[index].route);
                            },
                            child: Text(menu[index].text));
                      },
                    );
                  }
                  // Si l'utilisateur n'est pas connecté, retournez un widget vide
                  return ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, menu[index].route);
                          },
                          child: Text(menu[index].text));
                    },
                  );
                },
              ),
            ),
            Flexible(
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  // Vérifiez si l'utilisateur est connecté avant d'afficher le bouton
                  if (snapshot.hasData) {
                    return ElevatedButton(
                        child: Text('Se déconnecter',
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, "/");
                        });
                  }
                  // Si l'utilisateur n'est pas connecté, retournez un widget vide
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/authentification');
                      // Le code à exécuter quand le bouton est cliqué
                    },
                    child: Text('Se connecter'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
