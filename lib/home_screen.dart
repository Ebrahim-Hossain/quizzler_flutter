import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                child: Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      bool correctAnswer = quizBrain.getQuestionAnswer();
                      if (correctAnswer == true) {
                        log('you got it correct');
                      } else {
                        log('you got it wrong');
                      }

                      setState(() {
                        quizBrain.nextQuestion();
                        // if (questionsIndex == quizBrain.questionList.length) {
                        //   questionsIndex = 0;
                        // }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                child: Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      bool correctAnswer = quizBrain.getQuestionAnswer();
                      if (correctAnswer == false) {
                        log('you got it correct');
                      } else {
                        log('you got it wrong');
                      }

                      setState(() {
                        quizBrain.nextQuestion();
                        // if (questionsIndex == quizBrain.questionList.length) {
                        //   questionsIndex = 0;
                        // }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    Icon(Icons.close, color: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
