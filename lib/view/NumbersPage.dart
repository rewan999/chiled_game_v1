import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../controller/numbers_controller.dart';

class NumbersPage extends StatelessWidget {
  // const NumbersPage({Key? key}) : super(key: key);

  NumbersController numbersController = Get.put(NumbersController());

  NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  // width: Get.width * 0.7,
                  child: numbersController.loading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ScrollablePositionedList.builder(
                          itemScrollController:
                              numbersController.itemController,
                          scrollDirection: Axis.horizontal,
                          itemCount: numbersController.numbersList.length,
                          // shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              color: Colors.white,
                              height: Get.height,
                              width: Get.width,
                              // height: 50,
                              // margin: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Text(numbersController
                                      .numbersList[index].title
                                      .toString()),
                                  Text(numbersController
                                      .numbersList[index].correctAnswer
                                      .toString()),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(
                                          'http://10.0.2.2:8080/education/images/${numbersController.numbersList[index].image.toString()}'),
                                    )),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                ),
                Container(
                  width: Get.width * 0.9,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          numbersController.backward();
                        },
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 30)),
                      ),
                      GestureDetector(
                        onTap: () {
                          numbersController.forward();
                        },
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white, size: 30)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
