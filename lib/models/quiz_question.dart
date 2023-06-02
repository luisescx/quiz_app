class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffleQuestions() {
    final shuffleQuestions = List.of(answers);
    shuffleQuestions.shuffle();
    return shuffleQuestions;
  }
}
