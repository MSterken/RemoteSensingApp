
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remote_sensing_helper/libraryChapter.dart';
import 'package:remote_sensing_helper/question.dart';

class FileReader{
  Map<String, List<dynamic>> library = <String, List<dynamic>>{};
  Map<String, List<dynamic>> form = <String, List<dynamic>>{};

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

  Future<List<Question>?> getFormData() async {
    final String jsonString = await rootBundle.loadString('/text/formQuestions.json');
    form = Map.castFrom(json.decode(jsonString));
    List formData = form["questions"]!;
    final List<Question> l = [];
    for (var i = 0; i < formData.length; i++) {
      print(i);
      Question q = Question(formData[i]["question"]);
      List answerData = formData[i]["answers"];
      Map<String, String> a = {};
      for (var j = 0; j < answerData.length; j++){
        a[answerData[j]["answer"]] = answerData[j]["answerExplanation"];
      }
      q.addAnswersWithResponses(a);
      print(q.toString());
      l.add(q);
    }
    print(l.toString());
    return l;
  }

}