
import 'package:remote_sensing_helper/adviceDataManager.dart';
import 'package:remote_sensing_helper/fileReader.dart';
import 'package:remote_sensing_helper/librarySubject.dart';
import 'package:remote_sensing_helper/question.dart';
import 'package:remote_sensing_helper/questionChecker.dart';

class DataManager {

  final List<LibrarySubject> _libraryData = [];
  final List<Question> _questionData = [];
  final FileReader f = FileReader();
  final AdviceDataManager adviceDataManager = AdviceDataManager();
  final QuestionChecker _checker = QuestionChecker();


  DataManager();

  Future<void> createLibraryData() async {
   await f.getLibrary().then((value){
      _libraryData.addAll(value!);
    });
  }

  Future<void> createFormData() async {
    await f.getFormData().then((value) {
      _questionData.addAll(value as Iterable<Question>);
    });
    for (var i = 0; i < _questionData.length; i++) {
      //:todo logica voor welke vragen zichbaar zijn hier in
      _checker.addCheck(_questionData
          .elementAt(i)
          .question, true);
    }
  }

  List<Question> get questionData => _questionData;

  List<LibrarySubject> get libraryData => _libraryData;

  QuestionChecker get checker => _checker;
}