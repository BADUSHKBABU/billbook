import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/custom%20widgets/IiOKMessage.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/screens/IIHomeScreen/homedropdown.dart';
import 'package:billbook/user_admin/login/buisnesslogic/logic.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../iibase/custom widgets/IIButton.dart';
import '../../../screens/IIHomeScreen/IIhomescreenWithAcondition.dart';

class Loginbutton extends StatelessWidget {
  TextEditingController username;
  TextEditingController password;
   Loginbutton({super.key,required this.password,required this.username});

  @override
  Widget build(BuildContext context) {
    
    final _userregisterservice=Provider.of<UserRegisterService>(context,listen:  false);
    return IIButton(paddingright: 50,paddingleft:600,
                      onpress: ()async{
                      //tempry navivagtion , oncetest complete removr 
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIHomeScreenwithCondiion();}));
                      //uo to this
                        
                        print("button pressed1");
                       Logics logics=Logics(password: password.text,username: username.text);
                       print("bvalidation completeed");
                        DataVehicle d=DataVehicle();
                        print("attempting to send data ");
                     iiTransaction trn=iiTransaction();
                     trn.setP("pwd",logics.passwordEncryption(password.text));
                     trn.setP("username",username.text);
                     trn.setP("branchcode","asd");
                     print("step before gettoing esponse");

                     iiTransaction result= await d.getData("admin.user.login", trn);
                     print("an attempt for getting resposxe");
                   print("response frm server is :$result");
                  //  print("button preesed4, data saved at servers  ${trn.getData("parameter", 0, "username")}");
                    final response=result.toJSON();

                     print(" data json is : $response");
                     print("status from server : ${result.getData("parameter", 0, "status")}");//checking for a succesmessahe {1 for succes -1 if error}
                     String statuscode=result.getData("parameter", 0, "status");
                      bool isvalid=logics.validate(context);
                    logics.passwordEncryption(password.text);
                    //print("password is ${password.text}");
                   // print("encripted password is :${logics.passwordEncryption(password.text)}");
                  //  print("button preesed");
                     if(isvalid==false)
                     {
                       print(" failed validation");                      
                     }
                     else{
                      if(statuscode=="-1")//status code -1 error
                      {
                        showDialog(context: context, builder: (ctx){return IIOkMessage(label: "${result.getData("result", 0, "message")}",);});
                      }
                      else if(statuscode=="2")
                        {
                          print("button pressed  2");
                          print("irefid list  company list : ===${result.getData("parameter", 0, "irefid_list")}");
                          String company=result.getData("parameter", 0, "irefid_list");
                          print("iref id is (new)");
                          print(company);




                          Map<String,dynamic>company_list=jsonDecode(company);
                          Map<String, dynamic> authDataMap = company_list['tables']['auth_data'];
                        Map<String,dynamic> companynamelist={};
                       
                          for (String key in authDataMap.keys) {
                              String company = authDataMap[key]['company'];
                              //companynamelist.add(company);
                              String irefid = authDataMap[key]['irefid'];
                              print('Key: $key, Company: $company, IrefID: $irefid');
                                companynamelist.addAll({key:company});   
                                _userregisterservice.passingcompanylist(key, company);//now the iref is and company name is at userregistrationservice ,
                                //nextstep is to make these at companydropdown screen 
                                                     
                            }
                            //ierefid and companyname associated with 
                            print("this i sthe map of iref_id and company name asociated with...${_userregisterservice.companyname}");
                            //passing this map to provider, so that we can use this map in next page 
                            
                            
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIHomeDropdownSccreen();}));
                        }

                        else{ 
                          //showDialog(context: context, builder: (ctx){return IIOkMessage(label: "internet not available",);});  
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIHomeScreenwithCondiion();}));
                          }                       
                      
                     }
                    },Child:IILabel(label: "Login",) ,paddingtop: 10,);
  }
}


