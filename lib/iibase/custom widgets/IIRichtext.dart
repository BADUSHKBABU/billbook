import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/gestures.dart';

class Iirichtext extends StatelessWidget {
  double paddingbottom;
  double paddingleft;
  double paddingright;
  double paddingtop;
  Function ontapfunction;
  double fontsize;
  String texttobedisplayed;
   Iirichtext({super.key,this.paddingbottom=0,this.paddingleft=450,this.paddingright=0,this.paddingtop=0,required this.ontapfunction,this.fontsize=20,required this.texttobedisplayed});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding:  EdgeInsets.only(left: paddingleft,right: paddingright,bottom: paddingbottom,top:paddingtop ),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: texttobedisplayed,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async{
                        ontapfunction();
                        // DataVehicle _datavehhicle=DataVehicle();
                        // iiTransaction result=await _datavehhicle.getData("admin.user.reset_pwd", trn);
                        // print("resend otp ${trn.toJSON()}");
                      },
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: fontsize)),
              ]),
            ),
          );
  }
}