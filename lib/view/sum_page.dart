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
        body: SafeArea(
          child: Center(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage("assets/images/num8.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      ' ${sumPageController.randomNumber1}',
                      style: const TextStyle(fontSize: 60, color: Colors.red,
                          backgroundColor: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "+",
                      style: const TextStyle(fontSize: 60, color: Colors.green
                      ,backgroundColor: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ' ${sumPageController.randomNumber2}',
                      style: const TextStyle(fontSize: 60, color: Colors.blue,
                          backgroundColor: Colors.white ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      label: Text(
                        "Generate Numbers",
                        style: TextStyle(fontSize: 20),
                      ),
                      icon: Icon(
                        Icons.play_circle_sharp,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        sumPageController.getSum();
                      },
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Get.width * 0.7,
                      child: Form(
                          child: TextFormField(
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.orange,
                            backgroundColor: Colors.white),
                        keyboardType: TextInputType.number,
                        controller: sumPageController.resultController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            labelText: "enter the sum of numbers",
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white)),
                        // validator: (value) {
                        //   if (value ==) {
                        //     sumPageController.success.value = true;
                        //   }
                        // }
                      )),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      label: Text(
                        "submit",
                        style: TextStyle(fontSize: 35),
                      ),
                      icon: Icon(
                        Icons.check_circle_outline,
                        size: 40,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        sumPageController.checkResult(context);
                        ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
