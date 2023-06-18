import 'package:chiled_game_v1/Api/Api.dart';
import 'package:chiled_game_v1/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {

  TestController testController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(testController.currentScore.value.toString()),
        ),
        body: SafeArea(
          child: Center(
            child: testController.loading.value
                ? const Center(child: CircularProgressIndicator())
                : testController.list1.isEmpty
                    ? Column(
                      children: [
                        testController.currentScore.value < 5 && testController.currentScore.value != 0
                            ? Text('You need to try the first level again')
                            : Text(''),
                        const SizedBox(height: 10),
                        GestureDetector(
                            onTap: () async {
                              await testController.saveScore(testController.score.value);
                              await testController.getData();
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              color: Colors.blue,
                              child: Center(child: Text('Try again')),
                            ),
                          ),
                      ],
                    )
                    : Container(
                        width: Get.width * 0.9,
                        height: Get.height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: testController.list1.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(onTap: () async  {
                                    testController.idChose1.value = int.parse(
                                        testController.list1[index][0]);
                                    testController.index1.value = index;
                                    await testController.checkSolution();
                                  }, child: Obx(() {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          color: testController.index1.value ==
                                                  index
                                              ? Colors.grey
                                              : Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color:
                                                  testController.index1.value ==
                                                          index
                                                      ? Colors.black
                                                      : Colors.grey)),
                                      child: Center(
                                        child: Text(testController.list1[index]
                                                [1]
                                            .toString()),
                                      ),
                                    );
                                  }));
                                },
                              ),
                            ),
                            Container(
                              width: Get.width * 0.4,
                              height: Get.height,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: testController.list2.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      testController.idChose2.value = int.parse(
                                          testController.list2[index][0]);
                                      testController.index2.value = index;
                                      await testController.checkSolution();
                                    },
                                    child: Obx(() {
                                      return Container(
                                          width: 100,
                                          height: 100,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: testController
                                                              .index2.value ==
                                                          index
                                                      ? Colors.black
                                                      : Colors.grey,
                                                  width: testController
                                                              .index2.value ==
                                                          index
                                                      ? 3
                                                      : 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(
                                                    '${Api.url}/education/images/${testController.list2[index][1].toString()}'),
                                              )));
                                    }),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
          ),
        ),
      );
    });
  }
}
