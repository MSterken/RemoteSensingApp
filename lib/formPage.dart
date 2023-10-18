import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/answerField.dart';
import 'package:remote_sensing_helper/question.dart';

import 'dataManager.dart';

class FormPage extends StatefulWidget{

  DataManager manager;

  FormPage(this.manager, {super.key});
  @override
  _FormPageState createState() => _FormPageState(manager);


}
class _FormPageState extends State {
  DataManager d;

  _FormPageState(this.d);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: d.questionData.length,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: <Widget>[
                  Text(d.questionData.elementAt(index).question),
                  AnswerField(d.questionData.elementAt(index).answersWithResponses)
                ]
              );
            }
        ),
      ),
    );
  }
}