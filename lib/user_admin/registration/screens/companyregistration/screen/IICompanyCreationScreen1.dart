import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookDropdownList.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/companyregistration/screen/IICompanyCreationScreen2.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class IICompanyCreationScreen1 extends StatelessWidget {
  iiTransaction trn;
   IICompanyCreationScreen1({super.key,required this.trn});
  TextEditingController companynamecontroller=TextEditingController();
  TextEditingController statenamecontroller=TextEditingController();
  iTrnController companycontroller=iTrnController(iiTransaction());
  iTrnController statecontroller=iTrnController(iiTransaction());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Company Creation"),),
      body: IIBillBookTemplate(paddingtop: 100,actionlabel: "Create your Company account",actionlabelfontsize: 15,BillbookChildren: [
        BillbookTextFieldWidget(label: "company name", textEditingController: companynamecontroller, valuecontroller: companycontroller),
       BillbookDropdown(textedittingcontroller:statenamecontroller ,dropdownpaddingleft: 40,dropdownpaddingtop: 90,WidthOfDropdown: 420,label: "select your state", valuecontroller: statecontroller, dropdownList: ["kerala","tamilnadu","banglore","goa","karnadaka"]),
        IIButton(paddingleft: 450,onpress: ()async{
        DataVehicle _datavehhicle=DataVehicle();
        trn.setData("user_master", 0, "company", companynamecontroller.text);
        trn.setData("user_master",0,"state",statenamecontroller.text);
        print("with company ${trn.toJSON()}");
        iiTransaction result=await  _datavehhicle.getData("admin.user.register", trn);
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IICompanyCreationScreen2(trn: trn,);}));
        }, Child: IILabel(label: "Next",))
      ]),
    );
  }


}