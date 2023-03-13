import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_page.dart';

import '../data_quiz.dart';

class ResultPage extends StatelessWidget {
  static const String routeName = '/result';
  int rightAnswers = 0;

  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateResult();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset('images/result.jpg'),
            SizedBox(height: 10,),
            const Text('Correct Answers'),
            Text('$rightAnswers', style: TextStyle(fontSize: 30),),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, QuizPage.routeName),
              child: const Text('Go Back',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  calculateResult() {
    for(var question in questionList) {
      if(question.givenAnswer == question.rightAnswer) {
        rightAnswers++;
      }
    }
  }
}
