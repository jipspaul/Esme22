import 'package:flutter/material.dart';

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
                Text(
                  "GeoLearn",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0xFF3A736A),
                  ),
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 50),
                Text(
                  "Projet en cours de développement sur un autre GitHub.\nVous y serez convié prochainement.\n\nGroupe de Projet 3S4",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
