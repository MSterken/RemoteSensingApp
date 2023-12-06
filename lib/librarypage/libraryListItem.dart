import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/remotesensingpalette.dart';

class LibraryListItem extends StatefulWidget{

  String title;


  LibraryListItem(this.title);

  @override
  _libraryListItemState createState() => _libraryListItemState(title);

}
class _libraryListItemState extends State {

  String title;

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

  _libraryListItemState(this.title);


}