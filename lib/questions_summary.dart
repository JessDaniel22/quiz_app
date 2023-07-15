import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // caps the height of the section
      height: 300,
      child: SingleChildScrollView(
        //allows section to be scrollable
        child: Column(
          children: summaryData.map(
              // making the list class to a widget class because children only takes in widget classes
              (data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(backgroundColor: Colors.white),
                ),
                // type casting (as type) and to.String allows it to be turned into a String
                Column(
                  children: [
                    Text(data['question'].toString()),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('The correct answer was '),
                        Text(data['correct_answers'] as String),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Your answer was '),
                        Text(data['chosen_answers'] as String),
                      ],
                    ),
                  ],
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
