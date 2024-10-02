import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/iiregistrationscreen1.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/gestures.dart';

class Forgotpasswordwidget extends StatelessWidget {
  double paddingleft;
  double paddingright;
  double paddingbottom;
  double paddingtop;
   Forgotpasswordwidget({super.key,this.paddingbottom=0,this.paddingleft=0,this.paddingright=0,this.paddingtop=0});

  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding:  EdgeInsets.only(left: paddingleft,right:paddingright ,top:paddingtop ,bottom:paddingbottom ),
                        child: RichText(text:TextSpan(children: [
                         TextSpan(text: "forgot password",recognizer:TapGestureRecognizer()..onTap=(){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return IIRegistrationScreen1();}));
                         } ,style: TextStyle(color: Colors.black,fontSize: 15)),
                                            ]),),
                      );
  }
}