import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import '../customwidgets/question_set_widget.dart';
import '../data_quiz.dart';

class QuizPage extends StatefulWidget {
  static const String routeName = '/';
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String genderGroupValue = 'Male';
  late Timer timer;
  int tick = 10;
  String timeString = '';
  bool hasQuizStarted = false;
  @override
  void didChangeDependencies() {
    setTime();
    super.didChangeDependencies();
  }

  void setTime() {
    timeString = DateFormat('mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(tick * 1000));
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if(tick <= 0) {
        timer.cancel();
        navigateToResult();
      } else {
        setState(() {
          tick--;
          setTime();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('First page'),
        actions: [
          TextButton(
            onPressed: () {
              timer.cancel();
              navigateToResult();
            },
            child: const Text('FINISH', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Image.asset('images/quiz.jpg',),
              SizedBox(height: 10,),
              Text('$timeString', style: TextStyle(fontSize: 50),),
              if(!hasQuizStarted) ElevatedButton(
                onPressed: () {
                  setState(() {
                    hasQuizStarted = true;
                  });
                  startTimer();
                },
                child: const Text('Start Quiz'),
              ),
              if(hasQuizStarted) Expanded(
                child: Consumer<QuizProvider>(
                  builder:(context ,provider,child)=> ListView.builder(
                    itemCount: provider.questions.length,
                    itemBuilder: (context, index) {
                      final question = provider.questions[index];
                      return QuestionSetView(
                        index: index,
                        question: question,
                        onAnswered: (value) {
                          provider.questions[index].givenAnswer = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  navigateToResult() => Navigator.pushReplacementNamed(context, ResultPage.routeName);
}
