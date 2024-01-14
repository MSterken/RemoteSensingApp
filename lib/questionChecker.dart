
class QuestionChecker{

  Map<String, bool> _questionChecks = {};

  QuestionChecker();

  void addCheck(String question, bool visible){
    _questionChecks[question] = visible;
  }

  void setVisibilityQuestion(String question, bool visibility){
    print(question);
    print(_questionChecks[question]);
    _questionChecks[question] = visibility;
    print(_questionChecks[question]);
  }


  Map<String, bool> get questionChecks => _questionChecks;
}