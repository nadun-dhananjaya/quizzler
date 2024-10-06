import 'package:flutter/material.dart';
import 'package:quizzler/model/question.dart';
import 'package:quizzler/model/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizzler(),
    ),
  );
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(quizBrain.getQuestionNo()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  bool correctAnswer =
                      quizBrain.getQuestionAnswer(quizBrain.getQuestionNo());
                  if (correctAnswer == true) {
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  setState(() {
                    quizBrain.increaseQuestionNo();
                  });
                },
                child: Container(
                  height: 70,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  bool correctAnswer =
                      quizBrain.getQuestionAnswer(quizBrain.getQuestionNo());

                  if (correctAnswer == false) {
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }

                  setState(() {
                    quizBrain.increaseQuestionNo();
                  });
                },
                child: Container(
                  height: 70,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: scoreKeeper,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
