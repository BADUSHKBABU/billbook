import 'dart:convert';

import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/custom%20widgets/IiOKMessage.dart';
// import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/buisnesslogiforUserRegistration.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/buttonwidget.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/registerscreentemplate.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen4.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/Material.dart';

import '../buisnesslogic/registrationlist.dart';

class Iiregistrationscreen3 extends StatefulWidget {
  iiTransaction trn;
   Iiregistrationscreen3({super.key,required this.trn});

  @override
  State<Iiregistrationscreen3> createState() => _Iiregistrationscreen3State();
}

class _Iiregistrationscreen3State extends State<Iiregistrationscreen3> {
   TextEditingController password=TextEditingController();

   TextEditingController confirmpassword=TextEditingController();

   iTrnController passwordvaluecontroller=iTrnController(iiTransaction());
    RegisterserviceLogic logic=RegisterserviceLogic();
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: Column(
         children: [
           RegisterScreenTemplate(
            obsecurepassword: true,
            firstTextFieldheading: "password",
            firsttextEditingController: password,
            secondtextfieldheading: "confirm password",
            secondtextEditingController: confirmpassword,
            okmessagelabel: "password donot match",
            valuecontroller: passwordvaluecontroller,
            Billbooktempaltelabel: "set your password",
            isNormalField: false,
           ),
                                                                                        
           Buttonwidget(buttonlabel: "create", function: ()=>logic.thirdPageValidation(widget.trn,password.text,context))
         ],
       )

    );
  }


}