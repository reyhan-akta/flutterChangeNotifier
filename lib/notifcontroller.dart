import 'dart:async';

import 'package:flutter/cupertino.dart';

class NotifManager extends ChangeNotifier {
  bool _switchValue = false;
  bool get switchValue => _switchValue;
  late Timer timer;

  void toggleSwitch() {
    _switchValue = !_switchValue;
    timer.cancel();
    notifyListeners();
  }

  Future<void> turnOnOffBulb() async{
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      toggleSwitch();
    });
  }
}