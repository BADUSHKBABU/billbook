import 'dart:convert';


import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Material.dart';

class UserRegisterService extends ChangeNotifier
{


  iiTransaction _trn=iiTransaction();
  iiTransaction get trn=>_trn;


  void trnUpdate(iiTransaction tr)
  {
    tr=_trn;
    print("trn value ${trn.toJSON()}");
    notifyListeners();
  }
//   String ?_password;
//   String ?_username;
//   String? get password=>_password;
//   String? get username=>_username;

// UsernameAndPassword(String username1,String password1)
//   {
//     username1=_username!;
//     password1=_password!;
//     notifyListeners();

//   }
List<String> _company_list=[];// this is for converting Map that came from server to List, now only compay list 
List<String> get company_List=>_company_list;
Map<String,String> _companylist={};
Map<String,String> get companyname=>_companylist;
passingcompanylist(String key,String  company)
{
  _companylist.addAll({key:company});
  print("company list at provider is $_companylist");
  _company_list=_companylist.values.toList();//containg  map  containing iref id and company name to list of company name
  // this converted kist is used in homedropdown if the status code is 2(ie , a buisness profile has multiple company)
  print("lis of company from provider is $_company_list");
  notifyListeners();
  
}

}