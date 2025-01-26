import 'package:flutter/material.dart';

class QuestionTitle extends StatelessWidget {
  final int number;
  final String question;

  const QuestionTitle(this.number, this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class AnswerRow extends StatelessWidget {
  final String label;
  final String answer;
  final bool isCorrect;

  const AnswerRow(this.label, this.answer, this.isCorrect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            answer,
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class ResponseSummary extends StatelessWidget {
  final String userAnswer;
  final int questionNumber;
  final String questionLabel;
  final String correctAnswer;

  const ResponseSummary({
    super.key,
    required this.userAnswer,
    required this.questionLabel,
    required this.correctAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer = userAnswer == correctAnswer;

    return Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        child: Column(
          children: [
            QuestionTitle(questionNumber, questionLabel),
            Row(
              children: [
                Container(
                  color: Colors.black,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: Column(
                      children: [
                        AnswerRow('Correct answer:', correctAnswer, true),
                        AnswerRow('Your answer:', userAnswer, isCorrectAnswer),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
