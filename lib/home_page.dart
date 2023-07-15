import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});
  // void Function() - that takes no arguments allows a function (switchScreen) to be passed in as a value

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Quiz App',
            style: GoogleFonts.lilitaOne(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 28.0),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(150, 50),
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Color.fromARGB(255, 41, 41, 41),
                  width: 2,
                )),
            onPressed: switchScreen,
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            // adds an icon next to the button
            icon: const Icon(
              Icons.quiz_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
