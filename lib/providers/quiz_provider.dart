import 'package:flutter/material.dart';

import '../data_quiz.dart';

class QuizProvider extends ChangeNotifier{
  List<QuestionSet>questions=[];

  getAllQuestionSet(){
    questions=questionList;
    notifyListeners();
  }
}