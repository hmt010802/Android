import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCard extends StatelessWidget {
  final String tencv;
  final String ghichu;
  final DateTime day;
  final TimeOfDay time;
  final String colorText;

  MyCard(this.tencv, this.ghichu, this.day, this.time, this.colorText);

  @override
  Widget build(BuildContext context) {
    return Card (
      child: Row(
        children: [
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
                '${day.day}-${day.month}-${day.year} ${time.hour}:${time.minute}',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor(colorText),
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