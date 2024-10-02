import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IIColumn.dart';
import 'package:billbook/iibase/custom%20widgets/IIContainer.dart';
import 'package:billbook/iibase/custom%20widgets/IIRichtext.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
//import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/buisnesslogiforUserRegistration.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/registrationlist.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/buttonwidget.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen3.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen4.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen4.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/iiregistrationscreen1.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/gestures.dart';

class IIRegistationOTPScreen extends StatelessWidget {
  iiTransaction trn;
  IIRegistationOTPScreen({super.key, required this.trn});
  iTrnController otpvaluelitenablecontroller = iTrnController(iiTransaction());
  RegisterserviceLogic logic=RegisterserviceLogic();
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IIBillBookTemplate(
          //must check whether otp send ot not before having actionlabel
          actionlabel: "otp send to \n ${trn.getData("user_master", 0, "email")}  and  ${trn.getData("user_master", 0, "mobile")}",actionlabelfontsize: 15,paddingtop: 120,BillbookChildren: [
          BillbookTextFieldWidget(
              label: "OTP",
              textEditingController: otpcontroller,
              valuecontroller: otpvaluelitenablecontroller),
          Iirichtext(ontapfunction: ()=>logic.onTapFunctionForOtpScreen(trn,context), texttobedisplayed: "resend"),
          Buttonwidget(buttonlabel: "nect", function: ()=>logic.otpFunction(trn,context))
        ]));   
  }
}
