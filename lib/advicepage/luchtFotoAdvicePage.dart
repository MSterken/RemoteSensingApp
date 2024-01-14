import 'package:flutter/material.dart';

class luchtFotoAdvicePage extends StatefulWidget {
  final Map<String, String> luchtFotoAdviceList;

  luchtFotoAdvicePage(this.luchtFotoAdviceList, {super.key});

  @override
  State<luchtFotoAdvicePage> createState() => _luchtFotoAdvicePageState(luchtFotoAdviceList);
}

class _luchtFotoAdvicePageState extends State<luchtFotoAdvicePage> {

  Map<String, String> luchtFotoAdviceList;


  _luchtFotoAdvicePageState(this.luchtFotoAdviceList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advies Luchtfoto's"),
      ),body: Center(
        child: Column(
            children: [
              Expanded(child :ListView.builder(
                  itemCount: luchtFotoAdviceList.length,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                        children: <Widget>[
                          Text(luchtFotoAdviceList.values.elementAt(index),
                            style: TextStyle(fontSize: 25),)
                        ]);
                  }
              ))
            ]))
    );
  }
}
