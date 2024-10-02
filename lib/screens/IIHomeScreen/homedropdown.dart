import 'package:billbook/iibase/custom%20widgets/IIDropdown.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IIHomeDropdownSccreen extends StatelessWidget {
   IIHomeDropdownSccreen({super.key});
TextEditingController controller=TextEditingController();
Map<String ,dynamic> companynameandIrefId={};
  @override
  Widget build(BuildContext context) {
    List<String> coList=[];//create an empty list for storing company list name from provider 

    final _userregisterservice=Provider.of<UserRegisterService>(context,listen:  false);
    //assigning company list fro provider to empty list
    coList=_userregisterservice.company_List;
    return Scaffold(
      body: Iidropdownharcoded(
      labelstringList:coList,
    
    
       textEditingController: controller)
    );
  }
}