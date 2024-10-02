import 'dart:convert';

import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../../iibase/custom widgets/IiOKMessage.dart';

class Logics
{
  String password;
  String username;
Logics({required this.password,required this.username});

  bool validate(BuildContext context){
  // final _loginprovider=Provider.of<loginService>(context,listen: false);
    if(username.isEmpty || password.isEmpty ||username==null || password==null){
    
      showDialog(context: context, builder: (context){return IIOkMessage(label: "user name/pASSWORD is empty");});
      print("usesrnmae/password is empty");
      return false;
    }
    else{   
      
       return true;}

  }

  String passwordEncryption(String password) {
    //final _loginprovider=Provider.of<loginService>(context,listen: false);
     return md5.convert(utf8.encode(password)).toString();
    //print("encrypted password is : ${md5.convert(utf8.encode(password)).toString()}");
  }



  
} 

