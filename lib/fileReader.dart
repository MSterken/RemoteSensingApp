
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remote_sensing_helper/advice.dart';
import 'package:remote_sensing_helper/libraryChapter.dart';
import 'package:remote_sensing_helper/question.dart';

class FileReader{
  Map<String, List<dynamic>> library = <String, List<dynamic>>{};
  Map<String, List<dynamic>> form = <String, List<dynamic>>{};

  Future<Map<String,List<String>>?> getLibrary() async {
    final String jsonString = await rootBundle.loadString('assets/text/library.json');
    library = Map.castFrom(json.decode(jsonString));
    List libraryData = library["libraryObjects"]!;
    final Map<String, List<String>> m = {};
    for(var i = 0; i < libraryData.length; i++ ){
      String title = libraryData[i]["title"];
      List paragraphsRaw = libraryData[i]["paragraphs"];
      List<String> paragraphs = [];
      for (var j = 0; j < paragraphsRaw.length; j++){
        paragraphs.add(paragraphsRaw[j]["text"]);
      }
      LibraryChapter l = LibraryChapter(title, paragraphs );
      m[l.title] = l.paragraphs;
    }
    return m;
  }

  Future<List<Question>?> getFormData() async {
    final String jsonString = await rootBundle.loadString('assets/text/formQuestions.json');
    form = Map.castFrom(json.decode(jsonString));
    List formData = form["questions"]!;
    final List<Question> l = [];
    for (var i = 0; i < formData.length; i++) {
      Question q = Question(formData[i]["question"]);
      List answerData = formData[i]["answers"];
      Map<String, Advice> a = {};

      for (var j = 0; j < answerData.length; j++){
        Advice advice = Advice(answerData[j]["scoreLiDAR"],
            answerData[j]["scoreLuchtfoto"],
            answerData[j]["scoreMultiSpec"],
            answerData[j]["advice"],
            answerData[j]["adviceLiDAR"],
            answerData[j]["adviceLuchtfoto"],
            answerData[j]["adviceMultiSpec"]);
        a[answerData[j]["answer"]] = advice;
      }
      q.addAnswersWithResponses(a);
      l.add(q);
    }
    return l;
  }

}