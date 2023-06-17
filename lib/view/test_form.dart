import 'package:chiled_game_v1/view/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TestForm extends StatefulWidget {
  const TestForm({Key? key}) : super(key: key);
  @override
  State<TestForm> createState() => TestFormState();
}

class TestFormState extends State<TestForm> with SingleTickerProviderStateMixin {
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
                    "Welcome !",
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
                        return "please enter correct name";
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
                      const Text("Sign Up",
                          style: TextStyle(fontSize: 22, color: Colors.green)),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(()=>TestScreen());
                          // if (formKey.currentState!.validate())
                          //   final snackbar =
                          //       SnackBar(content: Text("Submitting Form"));
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