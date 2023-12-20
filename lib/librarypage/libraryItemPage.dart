import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/librarySubject.dart';
import 'package:remote_sensing_helper/librarypage/librarySubPage.dart';

import 'libraryListItem.dart';

class LibraryItemPage extends StatefulWidget {
  const LibraryItemPage(this.subject ,{super.key});

  final LibrarySubject subject;

  @override
  State<LibraryItemPage> createState() => _LibraryItemPageState(subject);
}

class _LibraryItemPageState extends State<LibraryItemPage> {

  LibrarySubject subject;

  _LibraryItemPageState(this.subject);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: subject.libraryMinorSubjects.length ,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute
                        (builder: (context) => LibrarySubPage(subject.libraryMinorSubjects.elementAt(index))));
                  },
                  child: LibraryListItem(subject.libraryMinorSubjects.elementAt(index).subTitle,
                  )
              );
            }
        ),
      ),
    );
  }
}
