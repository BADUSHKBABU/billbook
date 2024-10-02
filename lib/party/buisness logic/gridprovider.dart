import 'package:flutter/Material.dart';

class Gridprovider extends ChangeNotifier
{
  List<Map<String, dynamic>> _listofrow=[];
  List<Map<String, dynamic>> get listofrow=>_listofrow;


  void lsit(List<Map<String, dynamic>> l)
  {
    _listofrow=l;
    notifyListeners();
    print("row at provider is :  $_listofrow");
  }




//to save party tabel values
 List _billnumber=[];
 List get billnumber=>_billnumber;



    void tabletrn(List billno)
    {
     _billnumber=billno;
      notifyListeners();
    }


    int _partytableroecount=0;
    int get partytablerowcount=>_partytableroecount;
    void rowCount(int cnt)
    {
      cnt=_partytableroecount;
      notifyListeners();
    }
}