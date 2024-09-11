import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Text(questionNumber.toString()),
        Expanded(
          child: Column(children: [
            Text(questionLabel),
            const SizedBox(height: 8),
            Text(correctAnswer),
            Text(userAnswer)
          ],),
        )
      ],
    );
  }
}
