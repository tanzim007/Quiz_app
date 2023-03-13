import 'dart:async';
import 'package:flutter/material.dart';

import '../data_quiz.dart';

class QuestionSetView extends StatefulWidget {
  final int index;
  final QuestionSet question;
  final Function(String) onAnswered;
  const QuestionSetView(
      {Key? key, required this.index,
        required this.question,
        required this.onAnswered}) : super(key: key);

  @override
  State<QuestionSetView> createState() => _QuestionSetViewState();
}

class _QuestionSetViewState extends State<QuestionSetView> {
  String groupValue = '';


  @override
  void didChangeDependencies() {
    groupValue = questionList[widget.index].givenAnswer;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text('${widget.index + 1}.'),
          title: Text(widget.question.question),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.question.options.map((e) => ListTile(
              leading: Radio<String>(
                value: e,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value as String;
                  });
                  widget.onAnswered(groupValue);
                },
              ),
              title: Text(e),
            )).toList(),
          ),
        )
      ],
    );
  }
}
