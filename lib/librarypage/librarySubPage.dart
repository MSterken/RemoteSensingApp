import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/libraryMinorSubject.dart';

class LibrarySubPage extends StatefulWidget {

  final LibraryMinorSubject minor;

  const LibrarySubPage(this.minor,{super.key});

  @override
  State<LibrarySubPage> createState() => _LibrarySubPageState(minor);
}

class _LibrarySubPageState extends State<LibrarySubPage> {

  late LibraryMinorSubject minor;

  _LibrarySubPageState(this.minor);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(minor.subTitle),
      ),
      body: Container(
        width: double.maxFinite,
        child: Expanded (
          child: ListView.builder(
              itemCount: minor.paragraphs.length ,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(minor.paragraphs.elementAt(index).text,
                            style: TextStyle(fontSize: 15),),
                          ),
                          if (minor.paragraphs.elementAt(index).imagePath != "")
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage("assets/images/${minor.paragraphs.elementAt(index).imagePath}")),
                            )
                        ],
                      )
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
