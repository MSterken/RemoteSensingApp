import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/libraryListItem.dart';

class LibraryItemPage extends StatefulWidget {
  const LibraryItemPage(this.title, this.text ,{super.key});

  final String title;
  final String text;

  @override
  State<LibraryItemPage> createState() => _LibraryItemPageState(title, text);
}

class _LibraryItemPageState extends State<LibraryItemPage> {

String title;
String text;

  _LibraryItemPageState(this.title,this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:  Text(text),
      ),
    );
  }
}
