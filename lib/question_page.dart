import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.onselectedAnswer});
  final void Function(String answer)
      onselectedAnswer; // takes in an answer triggered by the selected answer (allows data to be saved later)
  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  var questionIndex = 0;

  void changeQuestion(String selectedAnswer) {
    // widget. gives access to variables in the widget class above
    widget.onselectedAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionIndex];
    return Center(
      // can use SizedBox and use width: double.infinity then set mainAxisAlignment to mainAxisAlignmnet.center
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lilitaOne(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center, // centers text
            ),
            const SizedBox(
              height: 16,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              // ... is a spread operator allows first list to be used
              // when something is passed into map -- affects every list item in this case
              // map returns a new list full of new objects and creates a widget class from something else
              (answers) {
                // this is the item that is going to be changed
                return AnswerButton(
                  text: answers,
                  onTap: () {
                    changeQuestion(
                        answers); // putting in the parentheses allows us to pass in an argument
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
