

import 'package:remote_sensing_helper/question.dart';
import 'package:remote_sensing_helper/questionChecker.dart';

class FormInfoManager{

  final List<Question> _questions = [];


  FormInfoManager();

  void addQuestions(List<Question> q ){
    _questions.addAll(q);

    }
  }

