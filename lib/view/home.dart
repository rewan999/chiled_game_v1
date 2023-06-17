import 'package:chiled_game_v1/view/NumbersPage.dart';
import 'package:chiled_game_v1/view/sum_page.dart';
import 'package:chiled_game_v1/view/test_form.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/144414-find-location.gif"),
                fit: BoxFit.fill)),
      ),
      Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              )),
          onPressed: () {
            //final player=AudioPlayer();
            // player.play(AssetSource('1.mp4'));
            Get.to(() => const Levels());
          },
          child: const Text(
            "Start",
            style:
                TextStyle(backgroundColor: Colors.black, color: Colors.white),
          ),
        ),
      ),
    ]));
  }
}

class Levels extends StatefulWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  State<Levels> createState() => LevelsState();
}

class LevelsState extends State<Levels> with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: Get.width * 0.8,
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => NumbersPage());
                },
                child: Column(
                  children: [
                    const Text(
                      "Knowing Numbers",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          backgroundColor: Colors.purple),
                    ),
                    Container(
                      height: Get.height * 0.8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/numbers.gif"),
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_downward_outlined,
                size: 50,
              ),
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SumPage());
                },
                child: Column(
                  children: [
                    const Text(
                      "Sum of numbers",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          backgroundColor: Colors.purple),
                    ),
                    Container(
                      height: Get.height * 0.8,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage("assets/images/sum.gif"),
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Get.to(() => const TestForm());
                },
                child: Column(
                  children: [
                    const Text(
                      "Test",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          backgroundColor: Colors.purple),
                    ),
                    Container(
                      height: Get.height * 0.8,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Container(
                        width: 200,
                        height: 75,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                image: AssetImage("assets/images/test.gif"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
