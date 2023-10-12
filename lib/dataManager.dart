
import 'package:remote_sensing_helper/fileReader.dart';

class DataManager {

  Map<String, String> _libraryData = {};
  Map<String, String> _questionData = {};
  final FileReader f = FileReader();


  DataManager();

  Future<void> createLibraryData() async {
   await f.getLibrary().then((value){
      print(value.toString() + " klote ");
      _libraryData.addAll(value!);
      print(_libraryData.toString() + " tering");
    });
  }

  Map<String, String> get questionData => _questionData;

  Map<String, String> get libraryData => _libraryData;
}