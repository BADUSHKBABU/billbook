// import 'package:flutter/Cupertino.dart';

import 'package:flutter/material.dart';
import '../transaction.dart';
import 'IiLabel.dart';
import 'package:intl/intl.dart';

class IIDateAndTime extends StatefulWidget {
  final ValueNotifier<DateTime> DateAndTimeController;
  final bool? IsDateOnly;
  IIDateAndTime({super.key, required this.DateAndTimeController, this.IsDateOnly});
  @override
  State<IIDateAndTime> createState() => _IIDateAndTimeState();
}
class _IIDateAndTimeState extends State<IIDateAndTime> {
  @override
  void initState() {
    super.initState();
  }
  late String displayText;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: widget.DateAndTimeController,
      builder: (context, value, _){
        if (widget.IsDateOnly == true) {
          displayText = DateFormat('dd/MM/yyyy').format(widget.DateAndTimeController.value);
        }
        else
        {
          displayText = DateFormat('dd/MM/yyyy   HH:mm').format(widget.DateAndTimeController.value);
        }
        return Column(
          children: [
            IILabel(label: displayText,color: Colors.black12,),
            ElevatedButton(
              onPressed: () { selectDate(context);},
              child: IILabel(label: "Select date"),
            ),
          ],
        );
      },
    );
  }

  Future selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(110),
      lastDate: DateTime(2501),
    );

    if (pickedDate != null) {
      setState(() {
        widget.DateAndTimeController.value = pickedDate;
      });

      if (widget.IsDateOnly == false) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(widget.DateAndTimeController.value),
        );
        if (pickedTime != null) {
          final DateTime finalDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          widget.DateAndTimeController.value = finalDateTime;
        }
      }
    }
  }
}
