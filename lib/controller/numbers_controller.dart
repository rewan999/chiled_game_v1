import 'dart:async';
import 'dart:math';

import 'package:chiled_game_v1/model/number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xrandom/xrandom.dart';

import '../Api/Api.dart';

class NumbersController extends GetxController {
  final itemController = ItemScrollController();
  final FlutterTts flutterTts = FlutterTts();

  RxBool loading = false.obs;
  RxList<Number> numbersList = <Number>[].obs;
  RxInt index = 0.obs;
  RxList<int> solveNumbers = <int>[].obs;

  RxBool success = false.obs;
  RxInt correctNumberIndex = (-1).obs;
  RxBool hide = false.obs;
  Timer? timer;
  RxInt time = 5.obs;

  @override
  void onInit() {
    super.onInit();
    loading.value = true;
    Api.getNumbers().then((value) {
      numbersList.addAll(value);
      print('----');
      loading.value = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  backward() {
    if (index.value != 0) {
      index.value -= 1;
      itemController.scrollTo(
          index: index.value, duration: const Duration(microseconds: 500));
    }
    getRandomNumbers(index.value);
  }

  forward() {
    if (index.value != numbersList.length) {
      /// condition to forward
      index.value += 1;
      itemController.scrollTo(
          index: index.value, duration: const Duration(microseconds: 500));
    }
    getRandomNumbers(index.value);
  }

  getRandomNumbers(int index) async {
    success.value = false;
    solveNumbers.clear();
    while (solveNumbers.length < 4) {
      int value = Random().nextInt(10);

      if (!solveNumbers.contains(value) &&
          value != int.parse(numbersList[index].correctAnswer!)) {
        solveNumbers.add(value);
      }
    }

    correctNumberIndex.value = Random().nextInt(3);
    solveNumbers[correctNumberIndex.value] =
        int.parse(numbersList[index].correctAnswer!);
    hide.value = false;
    time.value = 5;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time--;
      } else {
        timer.cancel();
      }
    });
    await Future.delayed(const Duration(milliseconds: 5000)).then((value) {
      hide.value = true;
    });
  }

  check(index) {
    if (correctNumberIndex.value == index) {
      Get.snackbar('Great !', 'You can move to the next level',
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20));
      customSpeak('Great !!');
      success.value = true;
    } else {
      Get.snackbar('Wrong', 'Try again',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20));
      customSpeak('Wrong, try again');
    }
  }

  speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(numbersList.isEmpty
        ? 'wait a second'
        : numbersList[index.value].title!);
  }

  customSpeak(text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.1);
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.speak(text);
  }
}
