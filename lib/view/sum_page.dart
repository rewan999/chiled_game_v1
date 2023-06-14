import 'package:chiled_game_v1/controller/sum_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumPage extends StatelessWidget {
  final TextEditingController textedit = TextEditingController();
  SumPageController sumPageController = Get.put(SumPageController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'First Number: ${sumPageController.randomNumber1}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Second Number: ${sumPageController.randomNumber2}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  sumPageController.getSum();
                },
                child: const Text('Generate Numbers'),
              ),
              const SizedBox(height: 20),
              Container(
                width: Get.width * 0.7,
                child: Form(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: sumPageController.resultController,
                  decoration: const InputDecoration(
                    labelText: "enter the sum of numbers",
                  ),
                  // validator: (value) {
                  //   if (value ==) {
                  //     sumPageController.success.value = true;
                  //   }
                  // }
                )),
              ),
              ElevatedButton(
                  onPressed: () {
                    sumPageController.checkResult(context);
                  },
                  child: const Text("SUBMIT")),
              ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("VOICE"))
            ],
          ),
        ),
      );
    });
  }
}
