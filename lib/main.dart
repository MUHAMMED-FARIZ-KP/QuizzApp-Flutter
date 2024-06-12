import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz/question.dart';
import 'package:quizz/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizBank =QuizBank();
void main() {
  runApp(Quizz());
}

class Quizz extends StatelessWidget {
  const Quizz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKeeper = [];
  void checkAnswer(bool userSelectedAnswer){
    bool correctAnswer=quizBank.getQustionAnswer();
    setState(() {
      if(quizBank.isFinished()==true){
        Alert(
          context: context,
          title: 'Finished',
          desc: "You are completed quiz successfully"
        ).show();
        quizBank.reset();
        ScoreKeeper=[];
      }else{
        if(userSelectedAnswer==correctAnswer){
          ScoreKeeper.add(Icon(Icons.done,color: Colors.green,));
        }
        else{
          ScoreKeeper.add(Icon(Icons.close,color: Colors.red,));
        }


        quizBank.nextQuestion();

      }

    });

  }





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(quizBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: () {
                checkAnswer(true);




              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: () {
                //quizBank.questionBank[questionNumber].questionAnswer=true;
                bool correctAnswer=quizBank.getQustionAnswer();
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
