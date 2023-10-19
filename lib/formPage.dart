import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/adviceDataManager.dart';
import 'package:remote_sensing_helper/advicePage.dart';
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

  AdviceDataManager a = AdviceDataManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child :ListView.builder(
                itemCount: d.questionData.length,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                      children: <Widget>[
                        Text(d.questionData.elementAt(index).question),
                        AnswerField(d.questionData.elementAt(index).answersWithResponses,a, d.questionData.elementAt(index).question)
                      ]
                  );
                }
            )),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdvicePage(a))
                );
              },
              child: Text("Get result"),
              )
          ],
        )
      ),
    );
  }
}