class Question {
  final String question;
  final List<String> answers;

  const Question(this.question, this.answers);

  String getCorrectAnswer () {
    return answers[0];
  }

  List<String> getShuffledList() {
    final List<String> copy = List.of(answers);

    copy.shuffle();

    return copy;
  }
}
