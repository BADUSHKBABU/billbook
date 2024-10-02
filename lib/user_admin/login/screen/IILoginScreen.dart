



import 'package:billbook/screens/IIHomeScreen/IIhomescreenWithAcondition.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:billbook/user_admin/login/widget/forgotpasswordwidget.dart';
import 'package:billbook/user_admin/login/widget/loginbutton.dart';
import 'package:billbook/user_admin/login/widget/loginformwidget.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/iiregistrationscreen1.dart';
//import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/registrationscreen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../../../iibase/controllers/IITRN.dart';
import '../../../../iibase/custom widgets/IIButton.dart';
import '../../../../iibase/custom widgets/IIColumn.dart';
import '../../../../iibase/custom widgets/IIContainer.dart';
import '../../../../iibase/custom widgets/IIRow.dart';
import '../../../../iibase/custom widgets/IITextEditingcontroller.dart';
import '../../../../iibase/custom widgets/IiLabel.dart';
import '../../../../iibase/custom widgets/IiOKMessage.dart';
import '../../../../iibase/custom widgets/IiYesNoMessage.dart';
import '../../../../iibase/datavehicle.dart';
import '../../../../iibase/transaction.dart';

class IILoginScreen extends StatelessWidget {
  IILoginScreen({super.key});
  iTrnController usernametextcontroller = iTrnController(iiTransaction());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool masked = false;
  @override
  Widget build(BuildContext context) {
     // final _loginprovider=Provider.of<loginService>(context,listen: false);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: IIColumn(IChildren: [
          Expanded(
            child: IIContainer(
              containercolor: Colors.blueGrey,
              Child: IIContainer(
                  paddingright: 400,
                  paddingleft: 50,
                  paddingbottom: 100,
                  paddingtop: 200,
                  containercolor: Colors.grey,
                  Child: IIColumn(
                    IChildren: [
                      //_loginprovider.UsernameAndPassword(username.text, password.text),
                      loginwidget(label: "username", isPasswordField: false,texteditingcontroller: username,),
                      loginwidget(label: "password", isPasswordField: true,obsecure: true,texteditingcontroller: password,),
                      Forgotpasswordwidget(paddingleft: 650,),
                    Loginbutton(password: password,username: username),
                     RichText(text:TextSpan(children: [
                      TextSpan(text: "new user?",style: TextStyle(color: Colors.black)),
                       TextSpan(text: "    Register",recognizer:TapGestureRecognizer()..onTap=(){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return 
                       IIRegistrationScreen1();
                      
                       }));
                       } ,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontSize: 20)),
                    ]),),
                    ])
                  ),
            ),
          )
        ]));
  }
}


