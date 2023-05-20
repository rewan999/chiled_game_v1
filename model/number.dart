
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Number {
  String? id;
  String? title;
  String? correctAnswer;
  String? image;

  Number({this.id, this.title, this.correctAnswer, this.image});

  Number.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    correctAnswer = json['correct_answer'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['correct_answer'] = this.correctAnswer;
    data['image'] = this.image;
    return data;
  }
}
