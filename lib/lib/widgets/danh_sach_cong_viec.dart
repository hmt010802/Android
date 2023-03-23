import 'package:flutter/material.dart';
import '../components/my_card.dart';
import '../models/cong_viec.dart';

class List_cv extends StatelessWidget {
  List<Congviec> listCV;
  List_cv(this.listCV);

  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: listCV.map((cv) {
            var textColor;
            var borderColor;
            DateTime timeNow = DateTime.now();
            if (cv.getDate.year == timeNow.year && cv.getDate.month == timeNow.month 
            && cv.getDate.day == timeNow.day && cv.getTime.hour == timeNow.hour 
            && cv.getTime.minute < timeNow.minute) {
              textColor = '#990000';
              borderColor = '#990000';
            } else if (cv.getDate.year == timeNow.year && cv.getDate.month == timeNow.month 
            && cv.getDate.day == timeNow.day && cv.getTime.hour < timeNow.hour) {
              textColor = '#990000';
              borderColor = '#990000';
            } else if (cv.getDate.year == timeNow.year && cv.getDate.month == timeNow.month 
            && cv.getDate.day < timeNow.day) {
              textColor = '#990000';
              borderColor = '#990000';
            } else if(cv.getDate.year == timeNow.year && cv.getDate.month < timeNow.month) {
              textColor = '#990000';
              borderColor = '#990000';
            } else if (cv.getDate.year < timeNow.year) {
              textColor = '#990000';
              borderColor = '#990000';
            } else {
              textColor = '#0000';
              borderColor = '#14e857';
            }
            return MyCard(cv.getTencv, cv.getGhichu, cv.getDate, cv.getTime, textColor, borderColor);
          }).toList(),
        ),
      ),
    );
  }
}