import 'package:flutter/material.dart' show BeveledRectangleBorder, BorderSide, BuildContext, Card, Colors, Column, CrossAxisAlignment, EdgeInsets, FontWeight, Padding, Row, StatelessWidget, Text, TextStyle, TimeOfDay, Widget;
import 'package:hexcolor/hexcolor.dart';

class MyCard extends StatelessWidget {
  final String tencv;
  final String ghichu;
  final DateTime date;
  final TimeOfDay time;
  final String textColor;
  final String borderColor;

  MyCard(this.tencv, this.ghichu, this.date, this.time, this.textColor, this.borderColor);

  @override
  Widget build(BuildContext context) {
    return Card (
      shape: BeveledRectangleBorder (
        side: BorderSide(
          color: HexColor(borderColor),
        ),
      ),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.symmetric (
            horizontal: 5,
            vertical: 5,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tencv,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
              Text(
                ghichu,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${date.day}-${date.month}-${date.year} ${time.hour}:${time.minute}',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor(textColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}