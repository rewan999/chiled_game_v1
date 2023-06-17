import 'package:chiled_game_v1/Api/Api.dart';
import 'package:chiled_game_v1/model/testData.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  RxList testData = <TestData>[].obs;
  RxList list1 = [].obs;
  RxList list2 = [].obs;
  RxInt idChose1 = (-1).obs;
  RxInt idChose2 = (-1).obs;
  RxInt index1 = (-1).obs;
  RxInt index2 = (-1).obs;

  RxBool loading = false.obs;

  @override
  void onInit(){
    super.onInit();
   getData();
  }

  getData(){
    loading.value = true;
    testData.clear();
    list1.clear();
    list2.clear();
    Api.getTest().then((value) async {
      if(value.isNotEmpty){
        testData.addAll(value);
        for (int i = 0; i < testData.length; i++) {
          list1.add([testData[i].id, testData[i].title]);
        }
        for (int i = 0; i < testData.length; i++) {
          list2.add([testData[i].id, testData[i].image]);
        }
        list1.shuffle();
        list2.shuffle();
        loading.value = false;
      }else{
        print('error');
        loading.value = false;
      }

    });
  }

  checkSolution() {
    if (idChose1.value != -1 && idChose2.value != -1) {
      if (idChose1.value == idChose2.value) {
        print('correct answer');
        // list1.removeWhere((item) => item[0] == idChose1.value);
        // list2.removeWhere((item) => item[0] == idChose2.value);
        list1.removeAt(index1.value);
        list2.removeAt(index2.value);
        print(list1.length);
        idChose1.value = -1;
        idChose2.value = -1;
        index1.value = -1;
        index2.value = -1;
        update();
      } else {
        print('try again');
        idChose1.value = -1;
        idChose2.value = -1;
      }
    }
  }
}
