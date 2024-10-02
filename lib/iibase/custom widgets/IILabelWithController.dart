import 'package:flutter/cupertino.dart';

import '../transaction.dart';

class IILabelControllerWidget extends StatelessWidget {
  final ValueNotifier<iiTransaction> ?controller;
  String ?label;
  double ?fontSize;
  Color? textColor;
   IILabelControllerWidget({super.key,required this.label,this.fontSize,this.textColor, this.controller});
  @override
  Widget build(BuildContext context){
   return
      ValueListenableBuilder(valueListenable: controller!, builder: (context , value,_){
        return Text(label!,style: TextStyle(fontSize:fontSize,color:textColor),);
      });
    }
  }

