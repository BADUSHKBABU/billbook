import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/user_admin/login/buisnesslogic/logic.dart';
// import 'package:billbook/user_admin/registration/screens/userregistrationscreen/buisnesslogic/buisnesslogiforUserRegistration.dart';
import 'package:flutter/Cupertino.dart';

class Buttonwidget extends StatefulWidget {
  String buttonlabel;
  // String firstfield;
  // String secondfield;
  // String okmessagelabel;
  Function function;
   Buttonwidget({super.key,required this.buttonlabel,
   required this.function
   });

  @override
  State<Buttonwidget> createState() => _ButtonwidgetState();
}

class _ButtonwidgetState extends State<Buttonwidget> {
  @override
  Widget build(BuildContext context) {
    return IIButton(onpress: (){
      
      widget.function();
        
     
    }, Child: IILabel(label: widget.buttonlabel,));
  }
}