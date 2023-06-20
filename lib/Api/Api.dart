import 'dart:convert';

import 'package:chiled_game_v1/model/testData.dart';
import 'package:http/http.dart' as http;

import '../model/number.dart';

class Api {
  static var url = "http://10.0.2.2:8080";
   //static var url = "http://192.168.1.31:8080";

  static Future<List<Number>> getNumbers() async {
    var request =
        http.Request('GET', Uri.parse('$url/education/api/all_numbers.php'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();

      final list = jsonDecode(data);

      List<Number> numbersList = <Number>[];

      for (var i in list) {
        var n = Number.fromJson(i);
        numbersList.add(n);
      }

      return numbersList;
    } else {
      return [];
    }
  }

  static Future<List<TestData>> getTest() async {
    var request =
        http.Request('GET', Uri.parse('$url/education/api/get_test.php'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();

      final list = jsonDecode(data);

      List<TestData> testList = <TestData>[];

      for (var i in list) {
        var n = TestData.fromJson(i);
        testList.add(n);
      }

      return testList;
    } else {
      return [];
    }
  }
}
