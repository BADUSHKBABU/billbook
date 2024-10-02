import 'package:flutter/Material.dart';

class BoolController extends ValueNotifier<bool>
{
  BoolController(super.value);
  bool get isChecked=>super.value;
   set isChecked(bool passedvalue)
  {
    if (passedvalue != value)
    {
      super.value = passedvalue;
    }
  }
}


