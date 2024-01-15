

import 'advice.dart';

class Question{
  String _question;
  Map<String, Advice> _answersWithResponses = {};

  Question(this._question);

  Map<String, Advice> get answersWithResponses => _answersWithResponses;

  String get question => _question;

  void addAnswersWithResponses(Map<String, Advice> a){
    _answersWithResponses.addAll(a);
  }

  @override
  String toString() {
    return 'Question{_question: $_question, _answersWithResponses: $_answersWithResponses}';
  }
}