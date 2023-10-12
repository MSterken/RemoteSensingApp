import 'package:flutter/material.dart';

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
      height: 50,
      padding: const EdgeInsets.all(10),
        child: Row(
        children: [
          Text(title),
          Text(text)
        ],
    )
    );
  }

  _libraryListItemState(this.title, this.text);


}