

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

  Color goodChoice = Colors.green;
  Color mediocreChoice = Colors.orange;
  Color badChoice = Colors.red;

  AdviceDataManager();

  void addAdvice(String question, Advice advice){
    if(_adviceList.containsKey(question)){
      _liDARScore = _liDARScore - _adviceList[question]!.liDARScore;
      _multiSpectraalScore = _multiSpectraalScore - _adviceList[question]!.multiSpectraalScore;
      _luchtFotoScore = _luchtFotoScore - _adviceList[question]!.luchtFotoScore;

    }
    _adviceList[question] = advice;
    _liDARAdviceList[question] = advice.adviceLiDAR;
    _luchtFotoAdviceList[question] = advice.adviceLuchtFoto;
    _multiSpecAdviceList[question] = advice.adviceMultiSpec;

    _liDARScore = _liDARScore + advice.liDARScore;
    _luchtFotoScore = _luchtFotoScore + advice.luchtFotoScore;
    _multiSpectraalScore = _multiSpectraalScore + advice.multiSpectraalScore;

  }

  Map<String, Advice> get adviceList => _adviceList;

  Color getLiDARColorAdvice(){
    if(_liDARScore > 10){
      return goodChoice;
    } else if (_liDARScore <= 10 && _liDARScore > 5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

  Color getLuchtfotoColorAdvice(){
    if(_luchtFotoScore > 10){
      return goodChoice;
    } else if (_luchtFotoScore <= 10 && _luchtFotoScore > 5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

  Color getMultiSpecColorAdvice(){
    if(_multiSpectraalScore > 10){
      return goodChoice;
    } else if (_multiSpectraalScore <= 10 && _multiSpectraalScore > 5){
      return mediocreChoice;
    } else {
      return badChoice;
    }
  }

}



