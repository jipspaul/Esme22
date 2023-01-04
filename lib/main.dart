import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/DidYouKnowUseCase.dart';
import 'package:flutter_application_1/domain/MenuUseCase.dart';
import 'package:flutter_application_1/ui/QuizzScreen.dart';
import 'package:flutter_application_1/ui/maps/mapsMobile.dart';
import 'package:flutter_application_1/ui/QuizzEnvoieScreen.dart';

void main() {
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
                child: ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, menu[index].route);
                          },
                          child: Text(menu[index].text));
                    }))
          ],
        ),
      ),
    );
  }
}
