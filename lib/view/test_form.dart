import 'dart:ui';

import 'package:chiled_game_v1/controller/test_controller.dart';
import 'package:chiled_game_v1/controller/test_form_controller.dart';
import 'package:chiled_game_v1/view/result_page.dart';
import 'package:chiled_game_v1/view/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TestForm extends StatefulWidget {
  TestForm({Key? key}) : super(key: key);
  @override
  State<TestForm> createState() => TestFormState();

}

class TestFormState extends State<TestForm> with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  TestFormController testFormController = Get.put(TestFormController());
  TestController testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx((){
      return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(),
          backgroundColor: const Color(0xFFffffff),
          body: testFormController.userState.value
              ? _userExist()
              :  SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: formKey, //key for form
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.04),
                    const Text(
                      "Here to Get",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    const Text(
                      "Welcome !",
                      style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                    ),
                    SizedBox(height: height * 0.05),
                    TextFormField(
                      controller: testFormController.nameController,
                      decoration: const InputDecoration(
                        labelText: "enter child name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-Z a-z]+$').hasMatch(value)) {
                          return "please enter correct name";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: height * 0.05),
                    TextFormField(
                      controller: testFormController.ageController,
                      decoration: const InputDecoration(
                        labelText: "enter child age",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "you have enter the age";
                        }
                        if (!RegExp(r'^[0-7]+$').hasMatch(value)) {
                          return "Sorry!! The child is Big for this Test";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sign Up",
                            style: TextStyle(fontSize: 22, color: Colors.green)),
                        ElevatedButton(
                          onPressed: () async {

                             if (formKey.currentState!.validate()){
                               final snackbar =
                               SnackBar(content: Text("Submitting Form"));

                            await testFormController.saveUserInfo();
                            await testFormController.loadUserData();
                            testController.currentScore.value = 0;
                            Get.to(()=>TestScreen());
                             }
                          },
                          child: const Icon(Icons.arrow_circle_right),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }

  _userExist(){
    return Container(
      width: Get.width,
      height: Get.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome ${testFormController.userName.value}"),
            const SizedBox(height: 20),
            Text("If you are not ${testFormController.userName.value}\nSubmit again"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    testFormController.userState.value = false;
                    testFormController.ageController.clear();
                    testFormController.nameController.clear();
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('Submit again'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                testFormController.userName.value == ''
                    ? const SizedBox()
                    :
                GestureDetector(
                  onTap: (){
                    // testFormController.userState.value = false;
                    Get.to(()=>ResultPage());

                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: Center(
                      child: Text('I am ${testFormController.userName.value}'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}