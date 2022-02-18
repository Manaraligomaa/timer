import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class TimerProvider with ChangeNotifier{
  late Timer _timer;
int _hour = 0;
int _minute = 0;
int _second = 0;
bool _start = true;
bool _stop = false;
bool _continu = false;
int get hour => _hour;
  int get minute => _minute;
  int get second => _second;
  bool get start=> _start;
  bool get stop=> _stop;
  bool get continu=> _continu;
  void startTimer(){
    _hour=0;
    _minute=0;
    _second=0;
    _start=false;
    _stop=true;
    _continu=false;
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      if(_second<59){
        _second++;
      }
      else if(_second==59){
        _second=0;
        if(_minute==59){
          _hour++;
          _minute=0;
        }
        else{
          _minute++;
        }
      }
      notifyListeners();
    });
  }
  void stopTimer(){
    if(_start==false){
      _start=true;
      _stop=false;
      _continu=true;
      _timer.cancel();
    }
    notifyListeners();
  }
  void continuTimer(){
    _start=false;
    _stop=true;
    _continu=false;
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      if(_second<59){
        _second++;
      }
      else if(_second==59){
        _second=0;
        if(_minute==59){
          _hour++;
          _minute=0;
        }
        else{
          _minute++;
        }
      }
      notifyListeners();
    });
  }
}