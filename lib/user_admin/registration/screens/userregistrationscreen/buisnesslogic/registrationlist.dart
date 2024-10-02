import 'dart:convert';

import 'package:billbook/iibase/custom%20widgets/IiErrorMessage.dart';
import 'package:billbook/iibase/custom%20widgets/IiOKMessage.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationOTPScreen.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen2.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen3.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen4.dart';
import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterserviceLogic{
  




firstPageValidator(String firstname,String secondname,context,String okmessagelabel)
{
  UserRegisterService _userRegisterService=Provider.of<UserRegisterService>(context,listen:false );
     bool validatingfirstpage()
      {
            if(firstname.isEmpty)
            {
              return false;
            }
            else
            {
              return true;
            }
      }
   if(validatingfirstpage()==true){
                DataVehicle _datavehhicle=DataVehicle();
                iiTransaction trn=iiTransaction();
                trn.setData("user_master", 0, "first_name", firstname);
                trn.setData("user_master", 0, "last_name", secondname);
                _userRegisterService.trnUpdate(trn);
                //print("status from server : ${result.getData("parameter", 0, "status")}");
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIRegistrationScreen2(trn: trn);}));
                }
                else{
                  showDialog(context: context, builder: (ctx){return IIOkMessage(label: okmessagelabel,);});}
}




//validation for second screen
secondPagevalidator(String mobilenumber,String email,context,String okmessagelabel,iiTransaction trn) async
{
  UserRegisterService _userRegisterService=Provider.of<UserRegisterService>(context,listen:false );
  bool isvalid=false;
     bool validatingsecondpage()
      {
            if(mobilenumber.isEmpty || email.isEmpty)
            {
              return false;
            }
            else
            {
              return true;
                emailvalidator(String email) {
    bool isvalid = EmailValidator.validate(email);
    return isvalid;
  }
            }
      }
   if(validatingsecondpage()==true)
   {
    if(EmailValidator.validate(email)==true)
    {
                DataVehicle _datavehhicle=DataVehicle();
                //iiTransaction trn=iiTransaction();
                trn.setData("user_master", 0, "mobile", mobilenumber);
                trn.setData("user_master", 0, "email", email);
                trn.setData("user_master", 0,"is_register", "1");
                _userRegisterService.trnUpdate(trn);
                iiTransaction result=await _datavehhicle.getData("admin.user.resetpwd", trn);
  print(result.toJSON());
  String responsefromserver=result.getData("result", 0, "type");
  print("response from seerver is ${responsefromserver}");
                                    //sample error comes when call this , below might me the messae came , result is the table name 0 is the index and others are the field
                                    //{"name":"","tables":{"parameter":{"0":{"@version":"50131"}},"result":{"0":{"message":"Invalid Instance-2","source":"login","type":"-1"}}}}
                                    //handling error  
                                    if(responsefromserver=="1")
                                    {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIRegistationOTPScreen(trn: trn);}));
                                    
                                    }
                                    else if(responsefromserver=="-2")
                                    {
                                      showDialog(context: context, builder: (ctx){return IIErrorMessage(label: "server error",);});
                                    }
                                    else if(responsefromserver=="-1")
                                    {
                                  showDialog(context: context, builder: (ctx){return IIErrorMessage(label: "server error",);});
                                    } 
   }
                 else{showDialog(context: context, builder: (ctx){return IIOkMessage(label: "invalid mail id",);});}
   }
                else{showDialog(context: context, builder: (ctx){return IIOkMessage(label: okmessagelabel,);});}
}



//ontap functopn for richtext otp screen {user registration}
onTapFunctionForOtpScreen(iiTransaction trn,BuildContext context) async
{
  UserRegisterService _userRegisterService=Provider.of<UserRegisterService>(context,listen:false );
    DataVehicle _datavehicle=DataVehicle();
    iiTransaction result=await _datavehicle.getData("admin.user.reset_pwd", trn);
    print("reslu of sending resend otp is ${trn.toJSON()}");
}
otpFunction(iiTransaction trn,context)
{
DataVehicle _datavehicle=DataVehicle();
Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return Iiregistrationscreen3(trn: trn);}));
}



//function for password screen {user registration}
thirdPageValidation(iiTransaction trn,password,BuildContext context) async
{
  UserRegisterService _userRegisterService=Provider.of<UserRegisterService>(context,listen:false );
   String passwordEncryption(String password ) {
     return md5.convert(utf8.encode(password)).toString();
    //print("encrypted password is : ${md5.convert(utf8.encode(password)).toString()}");
  }
  String encryptedpasw=passwordEncryption(password);
  DataVehicle _datavehhicle=DataVehicle();
  trn.setData("user_master", 0, "password", encryptedpasw);
  _userRegisterService.trnUpdate(trn);
  
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIRegistrationscreen4(trn: trn);}));
  print(trn.toJSON());//checking for data 
}
}