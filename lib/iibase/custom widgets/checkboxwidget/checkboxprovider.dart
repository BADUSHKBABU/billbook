import 'package:flutter/Cupertino.dart';

class  checkboxprovider extends ChangeNotifier
{
  int _valuetobesend=0;
  int get valuetobesend=>
  _valuetobesend;

  void ValuetoBeSend(int v)
  {
    _valuetobesend=v;
    notifyListeners();
  }
}