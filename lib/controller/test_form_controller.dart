

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestFormController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  RxBool userState = false.obs;
  RxString userName = ''.obs;
  RxInt userScore = 0.obs;
  RxString userAge = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadUserData();

  }

  saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('age', ageController.text);
  }

  loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString("name") ?? "";
    userScore.value = prefs.getInt("score") ?? 0;
    userAge.value = prefs.getString("age") ?? "";
    if(userName.value != ''){
      userState.value = true;
    }
  }





}