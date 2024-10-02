import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';

import '../transaction.dart';

class IINumericTextField extends StatelessWidget {
  bool? isborder = true;
  final ValueNotifier<iiTransaction>? valuecontroller;
  String? number;
  TextEditingController? textController=TextEditingController();
  void Function(String?)? onsubmitted;
  String? hint;

  IINumericTextField(
      {super.key,
       this.valuecontroller,
      this.isborder,
      this.number,
      this.textController,
      this.hint,
      this.onsubmitted});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valuecontroller!,
        builder: (context, value, _) {
          return TextFormField(
            
            controller: textController,
            onChanged: onsubmitted,
            validator: _validator,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText:hint ),
            //controller: TextEditingController(text: number),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          );
        });
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "field is empty ";
    }
  }
}
