import 'dart:async';

import 'package:get/get.dart';

class CounterController extends GetxController {
  //Observable Variable
  RxInt counter = 0.obs;
  RxString hello = "Hello".obs;
  RxDouble var2 = 0.1.obs;
  RxBool var3 = true.obs;

  startTimer() {
    Timer.periodic(Duration(seconds: 1), (sec) {
      counter.value++;
    });
  }

  increment() {
    counter++;
  }

  decrement() {
    counter--;
  }

  reset() {
    counter.value = 0;
  }
}
