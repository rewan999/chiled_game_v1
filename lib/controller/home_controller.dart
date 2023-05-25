import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xrandom/xrandom.dart';
import 'dart:math';

class HomeController extends GetxController {
  RxInt result = 0.obs;
  RxInt randomNumber1 = 0.obs;
  RxInt randomNumber2 = 0.obs;
  RxInt sum = 11.obs;
  increase() {
    result++;
  }

  decrease() {
    result--;
  }

  getSum() {
    while (sum.value >= 10) {
      randomNumber1.value = Random().nextInt(10) + 1;
      randomNumber2.value = Random().nextInt(10) + 1;
      sum.value = randomNumber1.value + randomNumber2.value;
    }
  }

  init() {
    result.value = 0;
  }
}
