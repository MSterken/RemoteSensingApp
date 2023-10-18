

class Question{
  String _question;
  Map<String, String> _answersWithResponses = {};

  Question(this._question);

  Map<String, String> get answersWithResponses => _answersWithResponses;

  String get question => _question;

  void addAnswersWithResponses(Map<String, String> a){
    _answersWithResponses.addAll(a);
  }

  @override
  String toString() {
    return 'Question{_question: $_question, _answersWithResponses: $_answersWithResponses}';
  }
}