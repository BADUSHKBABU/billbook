import 'package:flutter/Cupertino.dart';

class TextWidgetProvider extends ChangeNotifier
{
  String _changedString="";
  String get changeedString=>_changedString;

  void ErrorMessage(String e)
  {
    _changedString=e;
    //return  _changedString;
    print("errro chanaged, changed value is : $_changedString ");
   
    notifyListeners();
  }

}