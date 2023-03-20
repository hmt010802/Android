import 'package:flutter/material.dart';
import 'danh_sach_cong_viec.dart';
import '../models/cong_viec.dart';
import '../widgets/new_cong_viec.dart';

class Quanlycongviec extends StatelessWidget {
  List<Congviec> listCV;
  Quanlycongviec(this.listCV);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        List_cv(listCV),
      ],
    );
  }
}