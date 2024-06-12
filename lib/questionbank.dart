import 'question.dart';

class QuizBank{
  int _questionNumber=0;
  List<Question> _questionBank=[
    Question(q: 'Sharks are mammals.', a: false),
    Question(q: 'Sea otters have a favorite rock they use to break open food.', a: true),
    Question(q: 'An octopus has seven hearts.', a: false),
    Question(q: 'The blue whale is the biggest animal to have ever lived.', a: true),
    Question(q: 'When exiting a cave, bats always go in the direction of the wind', a: false),
    Question(q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Question(q: 'Pigs roll in the mud because they don\'t like being clean.', a: false),
    Question(q: 'Galapagos tortoises sleep up to 16 hours a day.', a: true),
    Question(q: 'The largest living frog is the Goliath frog of West Africa.', a: true),
    Question(q: 'An ant can lift 1,000 times its body weight', a: false),


  ];
  void nextQuestion(){
    if(_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;

  }
  bool getQustionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished(){
    if(_questionNumber==_questionBank.length-1){
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _questionNumber=0;
  }
}