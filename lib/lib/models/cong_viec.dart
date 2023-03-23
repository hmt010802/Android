import 'package:flutter/material.dart';

class Congviec {
  String tencv;
  String ghichu;
  DateTime date;
  TimeOfDay time;

  Congviec(this.tencv, this.ghichu, this.date, this.time);

  String get getTencv => tencv;
  set setTencv(String tencv) {
    this.tencv = tencv;
  }

  String get getGhichu => ghichu;
  set setGhichu(String ghichu) {
    this.ghichu = ghichu;
  }

  DateTime get getDate => date;
  set setDate(DateTime date) {
    this.date = date;
  }

  TimeOfDay get getTime => time;
  set setTime(TimeOfDay time) {
    this.time = time;
  }
}