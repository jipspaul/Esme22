import 'package:flutter/material.dart';

//TODO ==> LOGO APP à ajouter

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB9D1CE),
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Opacity(
                  opacity: 0.925,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Image.asset(
                      "assets/images/logos/GreenLogoGeoLearn.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(),
                      ),
                      Flexible(
                        flex: 8,
                        child: Row(),
                      ),
                      Flexible(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
