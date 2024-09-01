class Question {
  final String question;
  final List<String> answers;

  const Question(this.question, this.answers);

  List<String> getShuffledList() {
    final List<String> copy = List.of(answers);

    copy.shuffle();

    return copy;
  }
}
