class QuizQuestions {
  // defining what kind of data you want to store and any additional logic
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffled = List.of(
        answers); // creates a copt of the list of answers in new variable
    shuffled.shuffle(); // shuffles the list
    return shuffled; // returns the shuffled list
  }
}
