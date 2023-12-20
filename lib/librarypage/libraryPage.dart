
import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/dataManager.dart';
import 'package:remote_sensing_helper/librarypage/libraryItemPage.dart';
import 'package:remote_sensing_helper/librarypage/libraryListItem.dart';

class libraryPage extends StatefulWidget{

  DataManager d;


  libraryPage(this.d, {super.key});

  @override
  _libraryPageState createState() => _libraryPageState(d);

}
class _libraryPageState extends State {
  
  DataManager d;


  _libraryPageState(this.d);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: ListView.builder(
          itemCount: d.libraryData.length ,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: () { Navigator.push(context,
                MaterialPageRoute
                  (builder: (context) => LibraryItemPage(d.libraryData.keys.elementAt(index), d.libraryData.values.elementAt(index))));
                  },
                child: LibraryListItem(d.libraryData.keys.elementAt(index),
            )
          );
        }
      ),
    ),
  );
  }
}


