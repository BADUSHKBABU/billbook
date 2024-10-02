import 'package:flutter/Material.dart';
import 'package:flutter/Cupertino.dart';

import 'IiLabel.dart';

class IIYesNoMessage extends StatelessWidget {
  String label;
  Color ?textcolor;
  Color ?bgcolor;
  IIYesNoMessage({super.key, this.label="Proceed",this.bgcolor=Colors.blueGrey,this.textcolor=Colors.black});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgcolor,
      title:IILabel(label: label,color: textcolor,),
      actions:
      [
        TextButton(onPressed: (){
            Navigator.pop(context);
        }, child: IILabel(label: "yes",)),
        TextButton(onPressed: (){Navigator.pop(context);}, child: IILabel(label: "No",)),
      ],
    );
  }
}
