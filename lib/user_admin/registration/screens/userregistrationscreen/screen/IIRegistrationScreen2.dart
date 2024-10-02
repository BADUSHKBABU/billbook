import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/registrationlist.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/buttonwidget.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/registerscreentemplate.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';

class IIRegistrationScreen2 extends StatelessWidget {
  iTrnController valuecontroller = iTrnController(iiTransaction());
  iTrnController comboboxcontroller = iTrnController(iiTransaction());
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
    iiTransaction trn;
  RegisterserviceLogic logic = RegisterserviceLogic();
  
  IIRegistrationScreen2({super.key,required this.trn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RegisterScreenTemplate(
            okmessagelabel: "email/phn cant be empty",//no need of this parameter , it can be removed from template
            Billbooktempaltelabel: "Login with email and password",
            firstTextFieldheading: "phone\t\t\t",
            secondtextfieldheading: "email",
            firsttextEditingController: mobilecontroller,
            secondtextEditingController: emailcontroller,
            valuecontroller: valuecontroller,
          ),
          Buttonwidget(
            buttonlabel: "next",
            function: () => logic.secondPagevalidator(mobilecontroller.text, emailcontroller.text, context, "email/phn cant be empty",trn)
          ),
        ],
      ),
    );
  }
}
