import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/transaction.dart';
// import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/buisnesslogiforUserRegistration.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/registrationlist.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/buttonwidget.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/registerscreentemplate.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';

class IIRegistrationScreen1 extends StatelessWidget {
  iTrnController valuecontroller = iTrnController(iiTransaction());
  iTrnController comboboxcontroller = iTrnController(iiTransaction());
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RegisterserviceLogic logic = RegisterserviceLogic();
  
  IIRegistrationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RegisterScreenTemplate(
            okmessagelabel: "first name can't be empty",
            Billbooktempaltelabel: "Create an account",
            firstTextFieldheading: "First Name\t\t\t",
            secondtextfieldheading: "Secondname",
            firsttextEditingController: firstnamecontroller,
            secondtextEditingController: lastnamecontroller,
            valuecontroller: valuecontroller,
          ),
          Buttonwidget(
            buttonlabel: "next",
            function: () => logic.firstPageValidator(
              firstnamecontroller.text,
              lastnamecontroller.text,
              context,
              "firstname can't be empty",
            ),
          ),
        ],
      ),
    );
  }
}
