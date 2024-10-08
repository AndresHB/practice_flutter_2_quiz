import 'package:flutter/material.dart';
import 'package:practice_flutter_2_quiz/screens/splash.dart';
import 'package:practice_flutter_2_quiz/data/questions.dart';
import 'package:practice_flutter_2_quiz/screens/answers.dart';
import 'package:practice_flutter_2_quiz/screens/questions.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Widget? screen;
  List<String>? selectedAnswers;

  @override
  void initState() {
    super.initState();

    selectedAnswers = [];
    screen = Splash(onStart: onStartQuiz);
  }

  void onStartQuiz () {
    setState(() {
      screen = Questions(questions: questions, onPressAnswer: onPressAnswer);
    });
  }


  void onResetQuiz () {
    setState(() {
      selectedAnswers = [];
      screen = Splash(onStart: onStartQuiz);
    });
  }

  void onFinishQuiz () {
    setState(() {
      screen = Answers(answers: selectedAnswers!, questions: questions, onReset: onResetQuiz);
    });
  }

  void onPressAnswer(String answer) {
    selectedAnswers?.add(answer);

    if (selectedAnswers?.length == questions.length) {
      onFinishQuiz();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
