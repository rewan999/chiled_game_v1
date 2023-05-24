import 'package:chiled_game_v1/model/number.dart';
import 'package:get/get.dart';

import '../Api/Api.dart';

class NumbersController extends GetxController {
  RxList<Number> numbersList = <Number>[].obs;

  @override
  void onInit() {
    super.onInit();
    Api.getNumbers().then((value) {
      numbersList.addAll(value);
      print('----');
    });
  }
}
