import 'package:chiled_game_v1/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:chiled_game_v1/controller/test_form_controller.dart';
import 'package:get/get.dart';


class ResultPage extends StatelessWidget {

  final TestFormController testFormController = Get.find();
  final TestController testController = Get.find();

  ResultPage({super.key}){
    testController.getScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Text("Last Score: ${testFormController.userScore.value.toString()}",
                style:TextStyle(color: Colors.orange,fontSize:50)),
          ),
        ),
      ),
    );
  }
}
