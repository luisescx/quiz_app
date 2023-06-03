import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';

enum ScreenType {
  startScreen,
  questionsScreen,
  resultsScreen,
}

extension ScreenTypeExtension on ScreenType {
  String get value {
    switch (this) {
      case ScreenType.startScreen:
        return 'start-screen';
      case ScreenType.questionsScreen:
        return 'questions-screen';
      case ScreenType.resultsScreen:
        return 'results-screen';
      default:
        throw ArgumentError('Invalid screen type: $this');
    }
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  ScreenType activeScreen = ScreenType.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = ScreenType.questionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ScreenType.resultsScreen;
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      activeScreen = ScreenType.startScreen;
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = MyHomePage(switchScreen: switchScreen);

    if (activeScreen == ScreenType.questionsScreen) {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == ScreenType.resultsScreen) {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: onRestartQuiz,
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: screenWidget,
      ),
    );
  }
}
