import 'package:flutter/Material.dart';

class IIDateController extends ValueNotifier<DateTime>
{
  IIDateController(super.value);
  DateTime get datetime =>super.value;
  set datetime(DateTime passedvalue)
  {
    if (passedvalue != value)
    {
      super.value = passedvalue;
    }
  }
}