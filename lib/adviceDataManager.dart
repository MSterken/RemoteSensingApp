

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remote_sensing_helper/advice.dart';

class AdviceDataManager{

  final Map<String, Advice> _adviceList = {};
  final Map<String, String> _liDARAdviceList = {};
  final Map<String, String> _luchtFotoAdviceList = {};
  final Map<String, String> _multiSpecAdviceList = {};

  int _liDARScore = 0;
  int _luchtFotoScore = 0;
  int _multiSpectraalScore = 0;

  int _questionAmount = 0;

  Color goodChoice = Colors.green;
  Color mediocreChoice = Colors.orange;
  Color badChoice = Colors.red;

  AdviceDataManager();

  void addAdvice(String question, Advice advice){
    if(_adviceList.containsKey(question)){
      _liDARScore = _liDARScore - _adviceList[question]!.liDARScore;
      _multiSpectraalScore = _multiSpectraalScore - _adviceList[question]!.multiSpectraalScore;
      _luchtFotoScore = _luchtFotoScore - _adviceList[question]!.luchtFotoScore;

    }else{
      print(adviceList.toString());
      print(_questionAmount);
      _questionAmount++;
    }
    _adviceList[question] = advice;
    _liDARAdviceList[question] = advice.adviceLiDAR;
    _luchtFotoAdviceList[question] = advice.adviceLuchtFoto;
    _multiSpecAdviceList[question] = advice.adviceMultiSpec;

    _liDARScore = _liDARScore + advice.liDARScore;
    _luchtFotoScore = _luchtFotoScore + advice.luchtFotoScore;
    _multiSpectraalScore = _multiSpectraalScore + advice.multiSpectraalScore;

    print("Lidarscore = ");
    print(_liDARScore);
  }

  Map<String, Advice> get adviceList => _adviceList;

  Color getLiDARColorAdvice(){
    double average = getAverageScore(_liDARScore);
    print(average);
    if(average > 3.5){
      return goodChoice;
    } else if (average <= 3.5 && average > 2.5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

  Color getLuchtfotoColorAdvice(){
    double average = getAverageScore(_multiSpectraalScore);
    if(average > 3.5){
      return goodChoice;
    } else if (average <= 3.5 && average > 2.5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

  Color getMultiSpecColorAdvice(){
    double average = getAverageScore(_multiSpectraalScore);
    if(average > 3.5){
      return goodChoice;
    } else if (average <= 3.5 && average > 2.5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

  double getAverageScore(int score){
    double averageScore = score/_questionAmount;
    print(score);
    print(_questionAmount);
    print(averageScore);
    return score/_questionAmount;
  }

  Map<String, String> get multiSpecAdviceList => _multiSpecAdviceList;

  Map<String, String> get luchtFotoAdviceList => _luchtFotoAdviceList;

  Map<String, String> get liDARAdviceList => _liDARAdviceList;
}



