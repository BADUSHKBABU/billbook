import 'package:flutter/Material.dart';

class Stringcontroller extends ValueNotifier<String>
{
  Stringcontroller(super.value);
  String get value=>super.value;
  set ChangedErrorValue(String e)
  {
    super.value=e;
  }
}