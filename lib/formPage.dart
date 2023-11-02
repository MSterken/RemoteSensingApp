import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/adviceDataManager.dart';
import 'package:remote_sensing_helper/advicePage.dart';
import 'package:remote_sensing_helper/answerField.dart';
import 'package:remote_sensing_helper/remotesensingpalette.dart';
import 'dataManager.dart';

class FormPage extends StatefulWidget{

  final DataManager manager;

  const FormPage(this.manager, {super.key});
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
                  return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: remoteSensingPalette[100],
                      borderRadius: BorderRadius.all(Radius.circular(20)
                      )),
                      child:Column(
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(top:5 ,bottom: 5) ,
                            child:Text(d.questionData.elementAt(index).question)),
                        AnswerField(d.questionData.elementAt(index).answersWithResponses,a, d.questionData.elementAt(index).question)
                      ]
                  ));
                }
            )),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdvicePage(a))
                );
              },
              child: const Text("Get result"),
              )
          ],
        )
      ),
    );
  }
}