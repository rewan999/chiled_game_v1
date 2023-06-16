import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SumPageController extends GetxController {
  TextEditingController resultController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  RxInt randomNumber1 = 0.obs;
  RxInt randomNumber2 = 0.obs;
  RxInt sum = 11.obs;
  RxBool success = false.obs;

  getSum() {
    sum.value = 11;
    resultController.clear();
    FocusManager.instance.primaryFocus?.unfocus();

    while (sum.value >= 10) {
      randomNumber1.value = Random().nextInt(10);
      randomNumber2.value = Random().nextInt(10);
      sum.value = randomNumber1.value + randomNumber2.value;
    }
  }

  checkResult(context) {
    if (int.parse(resultController.text) == sum.value) {
      success.value = true;
      Get.snackbar('Great !', 'u can try again',
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20));
    } else {
      success.value = false;
      Get.snackbar('wrong', 'pleas try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20));
    }


    if (success.value == true) {
      tryAgain();
    }
  }

  tryAgain() {
    success.value = false;
    getSum();
  }

  speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak('test test');
  }
}
