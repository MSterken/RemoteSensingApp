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
  Function clearAdvices;

  AnswerField(this.clearAdvices, this.changeQuestion, this.answers,this.adviceDataManager,this.question,this.manager, {super.key});

  @override
  _AnswerFieldState createState() => _AnswerFieldState(clearAdvices, changeQuestion,answers, adviceDataManager, question, manager);



}
class _AnswerFieldState extends State {

  DataManager manager;
  Map<String, Advice> answers = {};
  List<String> l = [];
  String? dropdownValue;
  AdviceDataManager adviceDataManager;
  String question;
  Function changeQuestion;
  Function clearAdvices;

  _AnswerFieldState(this.clearAdvices, this.changeQuestion,this.answers, this.adviceDataManager,this.question,this.manager);

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
             if(value == "Bebouwing"){
               clearAdvices();
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                 if(question != manager.checker.questionChecks.keys.elementAt(i)){
                   changeQuestion(manager.checker.questionChecks.keys.elementAt(i), false);
                 }
               }


             } else if("Wat is het landgebruik in het onderzoeksgebied? " == question ) {
               print("aantal vragen");
               print(manager.adviceDataManager.questionAmount);
               //manager.adviceDataManager.increaseQuestionAmount(2);
               print(manager.adviceDataManager.questionAmount);
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                   changeQuestion(manager.checker.questionChecks.keys.elementAt(i), true);
               }
             }
             if (value == "Bos" || value == "Weiland"){
               if(manager.checker.questionChecks["Wat is de dichtheid van vegetatie?"] == false){
                 changeQuestion("Wat is de dichtheid van vegetatie?", true);
               }
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                 if(manager.checker.questionChecks.keys.elementAt(i) == "Welke gewassen zijn er aanwezig in het onderzoeksgebied? ") {
                   changeQuestion(manager.checker.questionChecks.keys.elementAt(i), false);
                 }
               }
             }else if(value == "Akker"){
               if(manager.checker.questionChecks["Welke gewassen zijn er aanwezig in het onderzoeksgebied? "] == false){
                 changeQuestion("Welke gewassen zijn er aanwezig in het onderzoeksgebied? ", true);
               }
               for(var i = 0; i < manager.checker.questionChecks.length; i++){
                 if(manager.checker.questionChecks.keys.elementAt(i) == "Wat is de dichtheid van vegetatie?")
                   changeQuestion(manager.checker.questionChecks.keys.elementAt(i), false);
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