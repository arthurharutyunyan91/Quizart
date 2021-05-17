import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../tmp_screen.dart';

class SplashScreenController extends GetxController {
  Timer _timer;
  int _start = 10;

  SplashScreenController() {
    loadData();
  }

  loadData() {
    startTimer(timer: _timer, start: _start, function: () => Get.to(TMPPage()));
  }

  navigateToHomePage() {
    Get.to(TMPPage());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

void startTimer({Timer timer, int start, Function function}) {
  const oneSec = const Duration(seconds: 1);
  timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
      if (start == 0) {
        timer.cancel();
        function.call();
      } else {
        start--;
      }
    },
  );
}
