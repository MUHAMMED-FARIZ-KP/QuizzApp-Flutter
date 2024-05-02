import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  List<Widget> ScoreKeeper = [];
  List<String> questions=['Sharks are mammals.',
  'Sea otters have a favorite rock they use to break open food.',
  'The blue whale is the biggest animal to have ever lived.',
  'The hummingbird egg is the world\'s smallest bird egg.',
  'Pigs roll in the mud because they don\'t like being clean.'];
  List<bool> answers=[
    false,
    true,
    true,
    true,
    false,
  ];
  int questionNumber=0;
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
              child: Text(questions[questionNumber],
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
                bool correctAnswer=answers[questionNumber];
                if(correctAnswer==true){
                  print('You are Right!');
                  }
                else{
                    print('You are Wrong!');
                }

                setState(() {
                  questionNumber=questionNumber+1;
                });



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
                bool correctAnswer=answers[questionNumber];
                if(correctAnswer==false){
                  print('You are Right!');
                }
                else{
                  print('You are Wrong!');
                }

                setState(() {
                  questionNumber=questionNumber+1;
                })  ;
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
