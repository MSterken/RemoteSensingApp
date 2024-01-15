import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/adviceDataManager.dart';
import 'package:remote_sensing_helper/advicepage/liDARAdvicePage.dart';
import 'package:remote_sensing_helper/advicepage/multiSpecAdvicePage.dart';

import 'luchtFotoAdvicePage.dart';

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
      advice.add(a.adviceList.values.elementAt(i).advice);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Advies"),
        ),
        body:
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(child :ListView.builder(
            // itemCount: advice.length,
            // itemBuilder: (BuildContext context, int index){
            //   return Column(
            //   children: <Widget>[
            //   Text(advice.elementAt(index),
            //   style: TextStyle(fontSize: 25),)
            //   ]);
            // }
            // )),
            OverflowBar(
                  children: [
                    Spacer(
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:SizedBox(
                            width: 200,
                            height: 200,
                            child:
                            OutlinedButton(onPressed: (){ Navigator.push(context,
                                MaterialPageRoute(builder: (context) => luchtFotoAdvicePage(a.luchtFotoAdviceList))
                            );}, child: Text("Luchtfoto",
                              style: TextStyle(fontSize: 20),),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 15.0,
                                  color: a.getLuchtfotoColorAdvice(),
                                  style: BorderStyle.solid,
                                ),
                              ),
                            )
                        ) ,
                      ),
                    )

                    ,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child:
                      SizedBox(
                          width: 200,
                          height: 200,
                          child:
                          OutlinedButton(onPressed: (){ Navigator.push(context,
                              MaterialPageRoute(builder: (context) => multiSpecAdvicePage(a.multiSpecAdviceList))
                          );}, child: Text("Multispectraal",
                              style: TextStyle(fontSize: 20)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 15.0,
                                color: a.getMultiSpecColorAdvice(),
                                style: BorderStyle.solid,
                              ),
                            ),
                          ))
                      ),
                    )
                    ,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:SizedBox(
                            width: 200,
                            height: 200,
                            child:
                            OutlinedButton(onPressed: (){ Navigator.push(context,
                                MaterialPageRoute(builder: (context) => liDARAdvicePage(a.liDARAdviceList))
                            );}, child: Text("LiDAR",
                                style: TextStyle(fontSize: 20)),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    width: 15.0,
                                    color: a.getLiDARColorAdvice(),
                                    style: BorderStyle.solid,
                                  ),
                                )
                            ))
                      ),
                    ),
                    Spacer()
                    ],
                )

,
          ]),
        )
        );
  }

}
