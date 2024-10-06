import 'package:quizzler/model/question.dart';

class QuizBrain {
  int _questionNo = 0;
  final List<Question> _questionBank = [
    Question(
        questionText: "You can lead a cow down stairs but not up stairs",
        questionAnswer: false),
    Question(
        questionText:
            "Approximately one quarter of human bones are in the feet",
        questionAnswer: true),
    Question(questionText: "A slug's blood is green", questionAnswer: true)
  ];

  int getQuestionNo() {
    return _questionNo;
  }

  void increaseQuestionNo() {
    if (_questionNo < (_questionBank.length - 1)) {
      _questionNo += 1;
    }
  }

  String getQuestionText(int questionNo) {
    return _questionBank[questionNo].questionText;
  }

  bool getQuestionAnswer(int questionNo) {
    return _questionBank[questionNo].questionAnswer;
  }
}
