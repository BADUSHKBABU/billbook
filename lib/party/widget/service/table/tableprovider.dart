import 'package:flutter/cupertino.dart';


//This provider clas is used for passing the bool value from partyscrren class to the table class 
//to reseting table's row 

class Tableprovider extends ChangeNotifier
{
  bool _issavebutton=false;
  bool get issavebutton=>_issavebutton;

  void chehcking_save_button(bool value )
  {
    _issavebutton=value;
    notifyListeners();
  }
}