import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: activeScreen == 'start-screen'
            ? MyHomePage(switchScreen: switchScreen)
            : const QuestionsScreen(),
      ),
    );
  }
}