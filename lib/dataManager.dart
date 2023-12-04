
import 'package:remote_sensing_helper/fileReader.dart';
import 'package:remote_sensing_helper/question.dart';

class DataManager {

  final Map<String, List<String>> _libraryData = {};
  final List<Question> _questionData = [];
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
    });
  }

  List<Question> get questionData => _questionData;

  Map<String, List<String>> get libraryData => _libraryData;
}