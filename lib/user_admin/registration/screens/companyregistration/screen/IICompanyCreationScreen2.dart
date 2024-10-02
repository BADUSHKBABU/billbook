import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IIDropdown.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/user_admin/login/screen/IILoginScreen.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookDropdownList.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Material.dart';

class IICompanyCreationScreen2 extends StatelessWidget {
  iiTransaction trn;
   
   IICompanyCreationScreen2({super.key,required this.trn,});
  iTrnController dropdownvaluecontroller=iTrnController(iiTransaction());
 TextEditingController surveycontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: IIBillBookTemplate(paddingleft: 90,paddingtop: 150,actionlabel: "\t\t\t\t\tBuisness profile created \n\t\t\t\t\tsuccessfully",
      BillbookChildren: [
        BillbookDropdown(textedittingcontroller:surveycontroller ,isRow: true,dropdownList: ["google","socialmedia","reference","others"],label: "How do you heard about us",valuecontroller: dropdownvaluecontroller,),
        IIButton(paddingtop: 40,paddingleft: 100,onpress: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IILoginScreen();}));
        }, Child: IILabel(label: "Continue",))
      ],
      
      ),
    );
  }
}