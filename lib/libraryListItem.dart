import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/remotesensingpalette.dart';

class LibraryListItem extends StatefulWidget{

  String title;
  String text;


  LibraryListItem(this.title, this.text);

  @override
  _libraryListItemState createState() => _libraryListItemState(title, text);

}
class _libraryListItemState extends State {

  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: remoteSensingPalette.shade100,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      height: 70,
      padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
        child:
          Center(
            child: Container(
              child:Text(title,
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),)

            ),
          ),
    );
  }

  _libraryListItemState(this.title, this.text);


}