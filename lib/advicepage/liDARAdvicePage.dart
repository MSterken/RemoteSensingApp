import 'package:flutter/material.dart';

class liDARAdvicePage extends StatefulWidget {
  final Map<String, String> liDARAdviceList;

  liDARAdvicePage(this.liDARAdviceList, {super.key});

  @override
  State<liDARAdvicePage> createState() => _liDARAdvicePageState(liDARAdviceList);
}

class _liDARAdvicePageState extends State<liDARAdvicePage> {

  Map<String, String> liDARAdviceList;


  _liDARAdvicePageState(this.liDARAdviceList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advies LiDAR"),
      ),
        body: Center(
            child: Column(
                children: [
            Expanded(child :ListView.builder(
            itemCount: liDARAdviceList.length,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                      children: <Widget>[
                        Text(liDARAdviceList.values.elementAt(index),
                          style: TextStyle(fontSize: 25),)
                      ]);
                }
            ))
    ])));
  }
}
