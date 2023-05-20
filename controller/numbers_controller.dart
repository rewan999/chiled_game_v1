import 'package:get/get.dart';


import '../Api/Api.dart';
import '../model/number.dart';

class NumbersController extends GetxController{

  RxList<Number> numbersList = <Number>[].obs;

  @override
  void onInit() {
    super.onInit();
    Api.getNumbers().then((value){
      numbersList.addAll(value);
    });
  }


}