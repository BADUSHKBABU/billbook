
import 'package:flutter/Material.dart';
import 'package:flutter/Cupertino.dart';

import 'IiLabel.dart';

class IIWarningMessage extends StatelessWidget {
  String label;
 // String action1;
  Color ?textcolor;

  IIWarningMessage({super.key, this.label="Not valid",this.textcolor=Colors.black});


  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.yellow,
      title:IILabel(label: label,color: textcolor),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: IILabel(label: "ok",color: Colors.white,)),
               ],
    );
  }
}
