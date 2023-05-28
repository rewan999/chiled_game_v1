import 'package:chiled_game_v1/controller/home_controller.dart';
import 'package:chiled_game_v1/view/NumbersPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/1.gif"), fit: BoxFit.fill)),
          ),
          ElevatedButton(
            onPressed: () {
              //final player=AudioPlayer();
              // player.play(AssetSource('1.mp4'));
              Get.to(()=> Levels());
            },
            child: Text("Start"),
          )
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
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "Here to Get",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  Text(
                    "Welcomed !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "enter child name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[A-Z a-z]+$').hasMatch(value!)) {
                        return "plese enter correct name";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "enter child age",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "you have enter the age";
                      }
                      if (!RegExp(r'^[0-7]+$').hasMatch(value!)) {
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

class LevelsState extends State<Levels>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(

        child:Stack(

          children:[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/1.gif"), fit: BoxFit.fill)),
            ),
            Center(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){

                      Get.to(()=> NumbersPage());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(

                          color: Colors.blue
                      ),
                      child: const Center(
                        child: Text('Knowing Numbers', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),

                  GestureDetector(
                    onTap: (){

                      Get.to(()=> NumbersPage());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(

                          color: Colors.blue
                      ),
                      child: const Center(
                        child: Text('Sum of Numbers', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight:FontWeight.bold),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),

                  GestureDetector(
                    onTap: (){

                      Get.to(()=> Info());
                    },
                    child: Container(
                      width: 200,
                      height: 75,
                      decoration: const BoxDecoration(

                          color: Colors.blue
                      ),
                      child: const Center(
                        child: Text('Test', style: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );}}
