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
        child: ListView.builder(
            itemCount: minor.paragraphs.length ,
            itemBuilder: (BuildContext context, int index){
              return Container(
                  child : Column(
                    children: [
                      Text(minor.paragraphs.elementAt(index).text),
                      if (minor.paragraphs.elementAt(index).imagePath != "")
                        Image(image: AssetImage("assets/images/${minor.paragraphs.elementAt(index).imagePath}"))
                    ],
                  )
              );
            }
        ),
      ),
    );
  }
}
