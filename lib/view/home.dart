import 'package:chiled_game_v1/controller/home_controller.dart';
import 'package:chiled_game_v1/view/NumbersPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lottie/lottie.dart';

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
        appBar: AppBar(),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/1.gif"),
                    fit: BoxFit.fill)),
          ),
          ElevatedButton(
            onPressed: () {
              //final player=AudioPlayer();
              // player.play(AssetSource('1.mp4'));
              Get.to(() => Levels());
            },
            child: const Text("Start"),
          ), //ListView(
          // children: [
          //// Load a Lottie file from your assets
          // Lottie.asset('assets/LottieLogo1.json'),])
        ]));
  }
}

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);
  @override
  State<Info> createState() => InfoState();
}

class InfoState extends State<Info> with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        backgroundColor: const Color(0xFFffffff),
        body: SingleChildScrollView(
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
                    "Welcomed !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "enter child name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[A-Z a-z]+$').hasMatch(value)) {
                        return "plese enter correct name";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
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
                      Text("Sign Up",
                          style: TextStyle(fontSize: 22, color: Colors.green)),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate())
                            final snackbar =
                                SnackBar(content: Text("Submitting Form"));
                        },
                        child: Icon(Icons.arrow_circle_right),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
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
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/1.gif"),
                      fit: BoxFit.fill)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => NumbersPage());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Knowing Numbers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => NumbersPage());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Sum of Numbers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Info());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Test',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Sum extends StatelessWidget {
  // const NumbersPage({Key? key}) : super(key: key);

  TextEditingController myController = TextEditingController();

  HomeController HController = Get.put(HomeController());
String storevalue="1,2,3,4,5,6,7,8,9,10";
  Sum({super.key});
  @override
  void dispose() {
    myController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'First Number: ${HController.randomNumber1}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Second Number: ${HController.randomNumber2}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                HController.getSum();
              },
              child: Text('Generate Numbers'),
            ),
            SizedBox(height: 20),
            Form(

                child: TextFormField(
                  keyboardType: TextInputType.number,
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: "enter the sum of numbers",
                    ),
                    validator: (value) {
                      if (value == storevalue) {

                          showDialog(context: context, builder: (context)
                          {
                            return AlertDialog(
                              actions: [
                                FloatingActionButton(
                                    child: Text("THIS IS CORECT!!!!")
                                    ,  onPressed: (){})
                              ],
                            );
                          });
                      }
                    }))
          ,
          ],
        ),
      );
    });
  }
}
