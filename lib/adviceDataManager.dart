

class AdviceDataManager{

  Map<String, String> _adviceList = {};

  AdviceDataManager();

  void addAdvice(String question, String advice){
    _adviceList[question] = advice;
  }

  Map<String, String> get adviceList => _adviceList;
}