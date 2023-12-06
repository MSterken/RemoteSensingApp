import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/mapChecker.dart';
import 'package:remote_sensing_helper/mappage/mapWidget.dart';



class mapPage extends StatefulWidget{

  @override
  _mapPageState createState() => _mapPageState();

}
class _mapPageState extends State {

  late MapChecker mapChecker;

  showDrone() {
    setState(() {
      mapChecker.changeTrue("https://map.godrone.nl/#loc=52.1553994,5.3574833,12.9");
    });
  }

  showAHN() {
    setState(() {
      mapChecker.changeTrue("https://ahn.arcgisonline.nl/ahnviewer/");
    });
  }

  showOud() {
    setState(() {
      mapChecker.changeTrue("https://www.topotijdreis.nl/kaart/1938/@186007,319659,10.97");
    });
  }

  showOndergrond() {
    setState(() {
      print('reaches');
      mapChecker.changeTrue("https://www.dinoloket.nl/ondergrondgegevens");
    });
  }

  showOndergrond2() {
    setState(() {
      mapChecker.changeTrue("https://www.dinoloket.nl/ondergrondmodellen/kaart");
    });
  }

  @override
  void initState() {
    mapChecker = MapChecker();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                height: 0.70 * (MediaQuery. of(context). size. height),
                width: MediaQuery. of(context). size. width,
                child: Stack(
                  children: [
                    MapWidget(mapChecker, "https://map.godrone.nl/#loc=52.1553994,5.3574833,12.9"),
                    MapWidget(mapChecker, "https://ahn.arcgisonline.nl/ahnviewer/"),
                    MapWidget(mapChecker, "https://www.topotijdreis.nl/kaart/1938/@186007,319659,10.97")
                  ],
                )
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () => showDrone(), child: Text("Drone"),
                ),
                ElevatedButton(onPressed: () => showAHN(), child: Text("AHN")),
                ElevatedButton(onPressed: () => showOud(), child: Text("Oud"))
              ],
            ),
            Row(
            children: [
            ElevatedButton(onPressed: () => showOndergrond(), child: Text("Ondergrond"),
            ),
            ElevatedButton(onPressed: () => showOndergrond2(), child: Text("Ondergrond2"))
            ],
            )
          ],
        ),
      ),
    );
  }




}