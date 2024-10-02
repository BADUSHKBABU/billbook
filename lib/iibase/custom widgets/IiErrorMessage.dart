
import 'package:flutter/Material.dart';

import 'IiLabel.dart';
class IIErrorMessage extends StatelessWidget {
  String label;
   IIErrorMessage({super.key,this.label="Error occured..!"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: IILabel(label: label,color: Colors.white,),
    backgroundColor: Colors.red,
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: IILabel(label: "ok",color: Colors.white,))
    ],);
  }
}
