import 'package:flutter/material.dart';

class multiSpecAdvicePage extends StatefulWidget {
   Map<String, String> multiSpecAdviceList;
   multiSpecAdvicePage(this.multiSpecAdviceList, {super.key});

  @override
  State<multiSpecAdvicePage> createState() => _multiSpecAdvicePageState(multiSpecAdviceList);
}

class _multiSpecAdvicePageState extends State<multiSpecAdvicePage> {
  Map<String, String> multiSpecAdviceList;


  _multiSpecAdvicePageState(this.multiSpecAdviceList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advies Multispectraal"),
      ),
        body: Center(
            child: Column(
                children: [
                  Expanded(child :ListView.builder(
                      itemCount: multiSpecAdviceList.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(multiSpecAdviceList.values.elementAt(index),
                                  style: TextStyle(fontSize: 25),),
                              )
                            ]);
                      }
                  ))
                ]))
    );
  }
}
