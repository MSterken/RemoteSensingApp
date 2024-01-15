
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remote_sensing_helper/SubjectParagraph.dart';
import 'package:remote_sensing_helper/advice.dart';
import 'package:remote_sensing_helper/libraryChapter.dart';
import 'package:remote_sensing_helper/libraryMinorSubject.dart';
import 'package:remote_sensing_helper/librarySubject.dart';
import 'package:remote_sensing_helper/question.dart';

class FileReader{
  Map<String, List<dynamic>> library = <String, List<dynamic>>{};
  Map<String, List<dynamic>> form = <String, List<dynamic>>{};

  Future<List<LibrarySubject>?> getLibrary() async {
    final String jsonString = await rootBundle.loadString('assets/text/library.json');
    library = Map.castFrom(json.decode(jsonString));
    List libraryData = library["libraryObjects"]!;
    final List<LibrarySubject> list = [];
    for(var i = 0; i < libraryData.length; i++ ){
      String title = libraryData[i]["title"];
      LibrarySubject subject = LibrarySubject(title);
      List subTitlesRaw = libraryData[i]["sub-texts"];
      for(var k = 0; k <subTitlesRaw.length; k++){
        String subTitle = subTitlesRaw[k]["sub-title"];
        List paragraphsRaw = subTitlesRaw[k]["paragraphs"];
        LibraryMinorSubject minor = LibraryMinorSubject(subTitle);
        for (var j = 0; j < paragraphsRaw.length; j++){
            String text = paragraphsRaw[j]["text"];
            String imagePath = "";
          if(paragraphsRaw[j]["image"] != null){
              imagePath = paragraphsRaw[j]["image"];
            }
            minor.addParagraph(text, imagePath);
          }
        subject.addMinorSubject(minor);
      }
      list.add(subject);
    }
    return list;
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