
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/providers/quiz_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>QuizProvider() ..getAllQuestionSet() ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: QuizPage.routeName,
    routes: {
        QuizPage.routeName:(context)=>QuizPage(),
      ResultPage.routeName:(context)=>ResultPage()
      },
    );
  }
}
