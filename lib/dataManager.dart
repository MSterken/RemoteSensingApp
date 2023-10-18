
import 'package:remote_sensing_helper/fileReader.dart';
import 'package:remote_sensing_helper/question.dart';

class DataManager {

  Map<String, String> _libraryData = {};
  List<Question> _questionData = [];
  final FileReader f = FileReader();


  DataManager();

  Future<void> createLibraryData() async {
   await f.getLibrary().then((value){
      _libraryData.addAll(value!);
    });
  }

  Future<void> createFormData() async {
    await f.getFormData().then((value){
      _questionData.addAll(value as Iterable<Question>);
      print(_questionData.toString() + "kaas");
    });
  }

  List<Question> get questionData => _questionData;

  Map<String, String> get libraryData => _libraryData;
}