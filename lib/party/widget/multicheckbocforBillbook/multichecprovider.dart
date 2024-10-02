import 'package:flutter/cupertino.dart';

class multicheckprovider extends ChangeNotifier
{
  int ?_value;
  int? get value=>_value;

  void valuechange(int s)
  {
    _value=s;
    notifyListeners();

  }
}