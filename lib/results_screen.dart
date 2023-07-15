import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/questions.dart';

class ResultsScreen extends StatelessWidget {
  // doesnt need to manage any internal state
  ResultsScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  final List<Map<String, Object>> summary = [];
  // Map is used to allow keys to be paired with values e.g correct answers: data/ questions: data
  List<Map<String, Object>> getSummary() {
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, // parentheses needed because it is of class Map
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'chosen_answers': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final numCorrectQuestions = summaryData.where((data) {
      return data['chosen_answers'] == data['correct_answers'];
    }).length;
    final numTotalQuestions = questions.length;
    return SizedBox(
      // another way of centering your features
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // another way of centering your features
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            ),
            const SizedBox(height: 16),
            QuestionsSummary(
              summaryData,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {},
                label: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
