import 'package:flutter/material.dart';


class AnswerField extends StatefulWidget{

  Map<String, String> answers = {};
  List<String> l = [];

  AnswerField(this.answers, {super.key});

  @override
  _AnswerFieldState createState() => _AnswerFieldState(answers);



}
class _AnswerFieldState extends State {

  Map<String, String> a = {};
  List<String> l = [];
  String? dropdownValue;

  _AnswerFieldState(this.a);

  @override
  void initState() {
    super.initState();
    for(var i = 0; i < a.length; i++ ){
      l.add(a.keys.elementAt(i));
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