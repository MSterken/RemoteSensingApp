import 'package:flutter/material.dart';

class LibraryItemPage extends StatefulWidget {
  const LibraryItemPage(this.title, this.paragraphs ,{super.key});

  final String title;
  final List<String> paragraphs;

  @override
  State<LibraryItemPage> createState() => _LibraryItemPageState(title, paragraphs);
}

class _LibraryItemPageState extends State<LibraryItemPage> {

String title;
List<String> paragraphs;

  _LibraryItemPageState(this.title,this.paragraphs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: paragraphs.length ,
          itemBuilder: (BuildContext context, int index){
            return Container(
                child : Text(paragraphs.elementAt(index))
              );
          }
      ),
      ),
    );
  }
}
