

import 'package:remote_sensing_helper/advice.dart';

class AdviceDataManager{

  Map<String, String> _adviceList = {};
  Map<String, String> _liDARAdviceList = {};
  Map<String, String> _luchtFotoAdviceList = {};
  Map<String, String> _multiSpecAdviceList = {};

  int _liDARScore = 0;
  int _luchFotoScore = 0;
  int _multiSpectraalScore = 0;

  AdviceDataManager();

  void addAdvice(String question, Advice advice){
    _adviceList[question] = advice.advice;
    _liDARAdviceList[question] = advice.adviceLiDAR;
    _luchtFotoAdviceList[question] = advice.adviceLuchtFoto;
    _multiSpecAdviceList[question] = advice.adviceMultiSpec;

    _liDARScore = _liDARScore + advice.liDARScore;
    _luchFotoScore = _luchFotoScore + advice.luchtFotoScore;
    _multiSpectraalScore = _multiSpectraalScore + advice.multiSpectraalScore;
  }

  Map<String, String> get adviceList => _adviceList;
}