import 'package:flutter/material.dart';
import 'package:quiz_app/question_page.dart';
import 'results_screen.dart';
import 'questions.dart';
import 'home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; // activeScreen can be null
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    // used to initialise variable -- in this case the active screen which would be the home page
    activeScreen =
        HomePage(switchScreen); //allows switchScreen to be used in the class
    super.initState();
  }

  void switchScreen() {
    // make a new method in order for it to be called later
    setState(() {
      // to allow the variable to change
      activeScreen = QuestionPage(
        onselectedAnswer: selectedAnswer,
      );
    });
  }

  void selectedAnswer(String answer) {
    selectedAnswers.add(answer); // makes a list of answers in selectedAnswers

    if (selectedAnswers.length == questions.length) {
      // if you have run out of questions go to next screen
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromARGB(255, 45, 45, 45),
                Color.fromARGB(255, 72, 71, 71)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child:
              activeScreen, // rendered UI is updated each time switchScreen is used (one way of switching screen)
        ),
      ),
    );
  }
}
