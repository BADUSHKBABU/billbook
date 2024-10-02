import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/companyregistration/screen/IICompanyCreationScreen1.dart';
import 'package:flutter/Material.dart';
class IIRegistrationscreen4 extends StatelessWidget {

iiTransaction trn;
   IIRegistrationscreen4({super.key,required this.trn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("registration"),),
      body: IIBillBookTemplate(actionlabel: "\t\t\t\tWelcome\n\t\t\tUser profile created successfully",actionlabelfontsize: 15,BillbookChildren: [
        Center(child: IILabel(label: "You can create a buisness account \n or\njoin an existing one ",color: Colors.black,Paddingtop: 150,)),
        IIRow(paddingtop: 20,IChildren: [
          IIButton(paddingleft: 100,onpress: (){}, Child: IILabel(label: "join",)),
          IIButton(paddingleft: 200,onpress: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IICompanyCreationScreen1(trn:trn);}));
          }, Child: IILabel(label: "create",))
        ])
      ],),
    );
  }
}