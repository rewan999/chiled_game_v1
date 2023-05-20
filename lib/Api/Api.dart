

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/number.dart';

class Api{

  static Future<List<Number>> getNumbers() async{

    var request = http.Request('GET', Uri.parse('http://192.168.1.3:8080/education/api/all_numbers.php'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String data = await response.stream.bytesToString();

      final list = jsonDecode(data);

      List<Number> numbersList = <Number>[];

      for(var i in list){
        var n = Number.fromJson(i);
        numbersList.add(n);
      }

      return numbersList;

    }
    else {
      return [];
    }
  }

}