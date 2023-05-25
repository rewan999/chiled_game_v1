import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/number.dart';


   var url = "http://10.0.2.2:8080";

class Api {

  static Future<List<Number>> getNumbers() async {
    var request = http.Request('GET',
        Uri.parse('$url/education/api/all_numbers.php'));

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
}
