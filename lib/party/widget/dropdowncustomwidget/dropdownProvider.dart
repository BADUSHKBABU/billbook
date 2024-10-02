

import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Material.dart';

class DropdownProvider extends ChangeNotifier



{
  List _dropdownList=[];
  Map<String, String> _stateMap = {};
  Map<String,String> get stateMap=>_stateMap;

List get dropDownList=>_dropdownList;
  void data(String query) async
  {
    iiTransaction trn=iiTransaction();
    DataVehicle d=DataVehicle();
    trn.setData("parameter", 0, "searchtext", query);
    iiTransaction response=await  d.getData("masters.party.stateList", trn);
    response.getData("list", 0, "name");
    print("response from server is :${response.toJSON()}");
      print("length is :${response.tableCount()}");
    if(response.tableCount()!=null)
  
    // ignore: curly_braces_in_flow_control_structures
    for(int i=0;i<response.tableCount()!;i++)
    {
      _dropdownList.add(response.getData("list", i, "name"));




    //  String name = response.getData("list", i, "name").toString().trim(); 
    //     String code = response.getData("list", i, "code").toString().trim();
        
        
    //     _stateMap[code] = name;
     //   print("list of states : $_dropdownList");

    }
    print("list of states : $_dropdownList");
    notifyListeners();




  }
}