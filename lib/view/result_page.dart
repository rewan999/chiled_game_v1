import 'package:flutter/material.dart';
import 'package:chiled_game_v1/controller/test_form_controller.dart';
import 'package:get/get.dart';


class ResultPage extends StatelessWidget {

  final TestFormController testFormController = Get.find();

  ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Center(
            child: Text("Last Score: ${testFormController.userScore.value.toString()}"),
          ),
        ),
      ),
    );
  }
}
