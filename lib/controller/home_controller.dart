import 'package:get/get.dart';

class HomeController extends GetxController{


  RxInt result = 0.obs;

  increase(){
    result ++;
  }

  decrease(){
    result --;
  }

  init(){
    result.value = 0;
  }

}