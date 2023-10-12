import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart';

class FileReader{
  Map<String, List<dynamic>> library = <String, List<dynamic>>{};

  Future<List<dynamic>?> getLibrary() async {
    final String jsonString = await rootBundle.loadString('/text/library.json');
    library = Map.castFrom(json.decode(jsonString));
    print(library);
    List? libraryData = library["libraryObjects"];
    print(libraryData);
    return libraryData;
  }

}