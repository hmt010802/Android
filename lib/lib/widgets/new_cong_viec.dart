import 'package:flutter/material.dart';
import '../models/cong_viec.dart';
import 'package:intl/intl.dart';

class Newcongviec extends StatefulWidget {
  Function addCV;
  Newcongviec(this.addCV);
  @override
  State<StatefulWidget> createState() => NewcongviecState(addCV);
}

class NewcongviecState extends State<Newcongviec> {
  Function addCV;
  NewcongviecState(this.addCV);
  final tencvController = TextEditingController();
  final ghichuController = TextEditingController();
  final deadlineController = TextEditingController();

  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  Future<void> selectedTime24Hour(BuildContext context) async {
    final TimeOfDay? pickedTime24Hour = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 47),
    );
    if (pickedTime24Hour != null && pickedTime24Hour != currentTime) {
      setState(() {
        currentTime = pickedTime24Hour;
      });
    }
  }

  void checkValid() {
    String tencv = tencvController.text;
    String ghichu = ghichuController.text;

    if (tencv.isEmpty || ghichu.isEmpty) {
      return;
    }

    Congviec cv = Congviec(tencv, ghichu, currentDate, currentTime);
    addCV(cv);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Tên công việc'),
          controller: tencvController,
          onSubmitted: (_) => checkValid(),
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Ghi chú công việc'),
          controller: ghichuController,
          onSubmitted: (_) => checkValid(),
        ),
        Text(currentDate == null ? 'Chưa chọn ngày' : DateFormat('dd-MM-yyyy').format(currentDate)),
        ElevatedButton(
          onPressed: () => selectDate(context),
          child: const Text('Lựa chọn ngày'),
        ),
        Text(currentTime == null ? 'Chưa chọn giờ' : '${currentTime.hour}:${currentTime.minute}'),
        ElevatedButton(
          onPressed: () => selectedTime24Hour(context),
          child: const Text('Lựa chọn giờ'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                checkValid();
              },
              child: const Text(
                'Thêm công việc',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.indigoAccent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
