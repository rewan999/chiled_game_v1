import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:xrandom/xrandom.dart';
import 'dart:math';

class HomeController extends GetxController {
  RxInt result = 0.obs;

  increase() {
    result++;
  }

  decrease() {
    result--;
  }


  init() {
    result.value = 0;
  }
}
