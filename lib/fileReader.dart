
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:remote_sensing_helper/libraryChapter.dart';

class FileReader{
  Map<String, List<dynamic>> library = <String, List<dynamic>>{};

  Future<Map<String,String>?> getLibrary() async {
    final String jsonString = await rootBundle.loadString('/text/library.json');
    library = Map.castFrom(json.decode(jsonString));
    List libraryData = library["libraryObjects"]!;
    final Map<String, String> m = {};
    for(var i = 0; i < libraryData.length; i++ ){
      LibraryChapter l = LibraryChapter(libraryData[i]["title"] as String, libraryData[i]["info"] as String);
      m[l.title] = l.text;
    }
    return m;
  }

}