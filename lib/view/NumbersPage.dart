import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/numbers_controller.dart';

class NumbersPage extends StatelessWidget {
  // const NumbersPage({Key? key}) : super(key: key);

  NumbersController numbersController = Get.put(NumbersController());

  NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Container(
              width: Get.width * 0.7,
              child: ListView.builder(
                itemCount: numbersController.numbersList.length,
                itemBuilder: (BuildContext context, index){
                  return Container(
                    color: Colors.lightBlue,
                    // height: 50,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(
                            numbersController.numbersList[index].title.toString()
                        ),
                        Text(
                            numbersController.numbersList[index].correctAnswer.toString()
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('http://192.168.1.3:8080/education/images/${numbersController.numbersList[index].image.toString()}'),
                              )
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
