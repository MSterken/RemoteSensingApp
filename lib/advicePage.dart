import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/adviceDataManager.dart';

class AdvicePage extends StatefulWidget {

  final AdviceDataManager a;

  const AdvicePage(this.a, {super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState(a);
}

class _AdvicePageState extends State<AdvicePage> {
  AdviceDataManager a;
  List<String> advice = [];

  _AdvicePageState(this.a);

  @override
  void initState() {
    super.initState();
    for(var i = 0; i < a.adviceList.length; i++){
      advice.add(a.adviceList.values.elementAt(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Advies"),
        ),
        body: Center(
        child: Column(
        children: [
          Expanded(child :ListView.builder(
          itemCount: advice.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
            children: <Widget>[
            Text(advice.elementAt(index))
            ]);
          }
          )),
        ]))
        );
  }


}
