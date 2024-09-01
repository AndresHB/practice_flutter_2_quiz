import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_flutter_2_quiz/widgets/answer.dart';
import 'package:practice_flutter_2_quiz/modules/question.dart';

class Questions extends StatefulWidget {
  final List<Question> questions;
  final void Function (String answer) onPressAnswer;

  const Questions({super.key, required this.questions, required this.onPressAnswer});

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  int questionIndex = 0;

  void onPressAnswer (String answer) {
    widget.onPressAnswer(answer);

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question form = widget.questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              form.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 201, 153, 251),
              ),
            ),
            const SizedBox(height: 24),
            ...form.getShuffledList().map((answer) => Answer(answer, () {
              onPressAnswer(answer);
            }))
          ],
        ),
      ),
    );
  }
}
