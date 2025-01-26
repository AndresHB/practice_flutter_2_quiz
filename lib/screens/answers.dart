import 'package:flutter/material.dart';

import 'package:practice_flutter_2_quiz/modules/question.dart';
import 'package:practice_flutter_2_quiz/widgets/title_text.dart';
import 'package:practice_flutter_2_quiz/widgets/response_summary.dart';

List<Map<String, Object>> _getSummary(
    {required List<String> answers, required List<Question> questions}) {
  final List<Map<String, Object>> summary = [];

  for (int i = 0; i < questions.length; i++) {
    final String answer = answers[i];
    final Question question = questions[i];
    final String correctAnswer = question.getCorrectAnswer();

    final Map<String, Object> value = {
      'user_answer': answer,
      'question_number': i + 1,
      'correct_answer': correctAnswer,
      'question_label': question.question,
    };

    summary.add(value);
  }

  return summary;
}

class Answers extends StatelessWidget {
  final void Function() onReset;
  final List<Map<String, Object>> summary;

  Answers({
    super.key,
    required answers,
    required questions,
    required this.onReset,
  }) : summary = _getSummary(answers: answers, questions: questions);

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = summary.length;
    final int totalCorrectAnswers = summary.fold(
        0,
        (int result, Map<String, Object> current) =>
            (current['user_answer'] == current['correct_answer']
                ? result + 1
                : result));

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleText('You answered $totalCorrectAnswers out of $totalQuestions questions correctly!'),
            const SizedBox(height: 32),
            ...summary.map((current) => ResponseSummary(
                  userAnswer: current['user_answer'] as String,
                  questionLabel: current['question_label'] as String,
                  correctAnswer: current['correct_answer'] as String,
                  questionNumber: current['question_number'] as int,
                )),
            const SizedBox(height: 32),
            TextButton(
              onPressed: onReset,
              child: const Text('Reset Quiz!'),
            )
          ],
        ),
    );
  }
}
