import 'package:flutter/material.dart';
import 'package:practice_flutter_2_quiz/modules/question.dart';
import 'package:practice_flutter_2_quiz/widgets/response_summary.dart';

List<Map<String, Object>> _getSummary ({ required List<String> answers, required List<Question> questions }) {
  List<Map<String, Object>> summary = [];

  for (int i = 0; i < questions.length; i++) {
    final String answer = answers[i];
    final Question question = questions[i];
    final String correctAnswer = question.getCorrectAnswer();

    final Map<String, Object> value = {
      'question_number': i,
      'user_answer': answer,
      'correct_answer': correctAnswer,
      'question_label': question.question,
    };

    summary.add(value);
  }

  return summary;
}

class Answers extends StatelessWidget {
  final void Function () onReset;
  final List<Map<String, Object>> summary;
  
  Answers({
    super.key,
    required answers,
    required questions,
    required this.onReset,
  }) : summary = _getSummary(answers: answers, questions: questions);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You answered X out of Y questions correctly!'),
            SizedBox(height: 32),
            ...summary.map((summary) => 
              ResponseSummary(
                userAnswer: summary['user_answer'] as String,
                questionLabel: summary['question_label'] as String,
                correctAnswer: summary['correct_answer'] as String,
                questionNumber: (summary['question_number'] as int) + 1,
              )
            ),
            SizedBox(height: 32),
            TextButton(onPressed: onReset, child: Text('Reset Quiz!'))
          ],
        ),
      ),
    );
  }
}
