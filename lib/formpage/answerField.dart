import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/dataManager.dart';

import '../advice.dart';
import '../adviceDataManager.dart';


class AnswerField extends StatefulWidget{

  Map<String, Advice> answers = {};
  List<String> l = [];
  AdviceDataManager adviceDataManager;
  String question;
  DataManager manager;
  Function changeQuestion;

  AnswerField(this.changeQuestion, this.answers,this.adviceDataManager,this.question,this.manager, {super.key});

  @override
  _AnswerFieldState createState() => _AnswerFieldState(changeQuestion,answers, adviceDataManager, question, manager);



}
class _AnswerFieldState extends State {

  DataManager manager;
  Map<String, Advice> answers = {};
  List<String> l = [];
  String? dropdownValue;
  AdviceDataManager adviceDataManager;
  String question;
  Function changeQuestion;

  _AnswerFieldState(this.changeQuestion,this.answers, this.adviceDataManager,this.question,this.manager);

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
             if(value == "Regen"){
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                 if(question != manager.checker.questionChecks.keys.elementAt(i)){
                   changeQuestion(manager.checker.questionChecks.keys.elementAt(i), false);
                 }
               }
             }else{
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                 changeQuestion(manager.checker.questionChecks.keys.elementAt(i), true);
               }
             }
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