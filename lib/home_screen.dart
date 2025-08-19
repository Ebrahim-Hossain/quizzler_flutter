import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> scoreKeeper = [];

  void checkAnswer({required bool pickedAnswer}) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if(quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quiz is Over",
          desc: "Please reset the quiz.Thank you.",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else{

      if (correctAnswer == pickedAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green),);
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red),);
      }

      quizBrain.nextQuestion();
      }
      // if (questionsIndex == quizBrain.questionList.length) {
      //   questionsIndex = 0;
      // }
    });
  }

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
                      checkAnswer(pickedAnswer: true);
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
                      checkAnswer(pickedAnswer: false);
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
                    children: scoreKeeper
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
