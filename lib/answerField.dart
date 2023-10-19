import 'package:flutter/material.dart';

import 'adviceDataManager.dart';


class AnswerField extends StatefulWidget{

  Map<String, String> answers = {};
  List<String> l = [];
  AdviceDataManager adviceDataManager;
  String question;

  AnswerField(this.answers,this.adviceDataManager,this.question, {super.key});

  @override
  _AnswerFieldState createState() => _AnswerFieldState(answers, adviceDataManager, question);



}
class _AnswerFieldState extends State {

  Map<String, String> answers = {};
  List<String> l = [];
  String? dropdownValue;
  AdviceDataManager adviceDataManager;
  String question;

  _AnswerFieldState(this.answers, this.adviceDataManager,this.question);

  @override
  void initState() {
    super.initState();
    for(var i = 0; i < answers.length; i++ ){
      l.add(answers.keys.elementAt(i));
    }
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        hint: Text("select"),
        icon: const Icon(Icons.arrow_downward),
        onChanged: (String? value) {
           setState(() {
             dropdownValue = value ?? "";
             adviceDataManager.addAdvice(question, answers[value]!);
           });
        },
        items: l.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),

    );
  }


}