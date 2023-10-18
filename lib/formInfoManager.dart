

import 'package:remote_sensing_helper/question.dart';

class FormInfoManager{

  List<Question> _questions = [];

  FormInfoManager();

  void addQuestions(List<Question> q ){
    _questions.addAll(q);
  }
}

