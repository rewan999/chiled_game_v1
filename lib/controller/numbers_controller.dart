import 'package:chiled_game_v1/model/number.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../Api/Api.dart';

class NumbersController extends GetxController {

  final itemController = ItemScrollController();
  RxBool loading = false.obs;
  RxList<Number> numbersList = <Number>[].obs;
  RxInt index = 0.obs;

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

  backward(){
    if(index.value != 0) {

      index.value -= 1;
      itemController.scrollTo(
          index: index.value, duration: const Duration(microseconds: 500));
    }
  }

  forward(){
    if(index.value != numbersList.length){
      /// condition to forward
      itemController.scrollTo(index: index.value, duration: const Duration(microseconds: 500));
      index.value +=1;
    }
  }



}
