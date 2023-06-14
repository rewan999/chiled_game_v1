import 'dart:math';

import 'package:chiled_game_v1/Api/Api.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../controller/numbers_controller.dart';

class NumbersPage extends StatelessWidget {
  // const NumbersPage({Key? key}) : super(key: key);
  final TextEditingController textedit = TextEditingController();

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
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              numbersController
                                                  .getRandomNumbers(index);
                                            },
                                            child: const Icon(Icons.refresh, size: 40),
                                          ),
                                        ),
                                      ),
                                      Obx((){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 30),
                                          child: Text(
                                              numbersController.time.toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25
                                            ),
                                          ),
                                        );
                                      })
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx((){
                                    return AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      child: numbersController.hide.value
                                          ? Container(
                                        key: ValueKey(0),
                                        width: 300,
                                        height: 400,
                                        color: Colors.white,
                                      )
                                          : Container(
                                        key: ValueKey(1),
                                        width: 300,
                                        height: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${Api.url}/education/images/${numbersController.numbersList[index].image.toString()}'),
                                            )),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                  Obx(() {
                                    return SizedBox(
                                      width: Get.width * 0.9,
                                      height: 70,
                                      // color: Colors.blue,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: numbersController
                                            .solveNumbers.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                if (!numbersController
                                                    .success.value) {
                                                  numbersController
                                                      .check(index);
                                                }
                                              },
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                decoration: BoxDecoration(
                                                  color: numbersController
                                                              .success.value &&
                                                          numbersController
                                                                  .correctNumberIndex
                                                                  .value ==
                                                              index
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  numbersController
                                                      .solveNumbers[index]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                              ));
                                        },
                                      ),
                                    );
                                  })
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
                          // numbersController.backward();
                          numbersController.speak();
                        },
                        child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: const Icon(Icons.keyboard_voice,
                                color: Colors.white, size: 30)),
                      ),
                      numbersController.success.value
                          ? GestureDetector(
                              onTap: () {
                                numbersController.forward();
                              },
                              child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.arrow_forward,
                                      color: Colors.white, size: 30)),
                            )
                          : const SizedBox(width: 50),
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
