import 'package:flutter/material.dart';
import 'quan_ly_cong_viec.dart';
import '../widgets/new_cong_viec.dart';
import '../models/cong_viec.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Congviec> listCV = [];
  void addCV(Congviec cv) {
    setState(() {
      listCV.add(cv);
    });
  }
  void showModelNewCongViec(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Newcongviec(addCV),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App quản lý công việc'),
      ),
      body: Quanlycongviec(listCV),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModelNewCongViec(context),
      ),
    );
  }
}