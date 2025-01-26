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
          TitleText(
              'You answered $totalCorrectAnswers out of $totalQuestions questions correctly!'),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(161, 122, 202, 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: summary
                        .map(
                          (current) => ResponseSummary(
                            userAnswer: current['user_answer'] as String,
                            questionLabel: current['question_label'] as String,
                            correctAnswer: current['correct_answer'] as String,
                            questionNumber: current['question_number'] as int,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: onReset,
            style: TextButton.styleFrom(
              elevation: 2,
              backgroundColor: const Color.fromRGBO(161, 122, 202, 0.5),
              shadowColor: Colors.black.withOpacity(0.2), // Sombra (si aplica)
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
            ),
            child: const Text(
              'Reset Quiz',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
