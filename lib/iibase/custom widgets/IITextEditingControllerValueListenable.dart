import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';


import '../transaction.dart';

class IITextEditingControllerValueListenable extends StatelessWidget {
  final ValueNotifier<iiTransaction>? valuecontroller;
  TextEditingController ?textcontroller;
  //String label;
  bool readonly;
  Color Iconcolor;
  String HintText;
  double sizedboxheight;
  double paddingtop;
  double paddingleft;
  double paddingright;
  double paddingbottom;
  void Function(String?) ?onchanged;
  IconButton ?suffixicon;
  void Function() ?ontap;
  bool obsecure;
  void Function() ?oncompleted;
  //Icon ?SuffixIcon;
  // String ?initialvalue;
  IITextEditingControllerValueListenable(
      {super.key,
         this.textcontroller,
        this.ontap,
       // required this.label,
        this.valuecontroller,
        this.readonly = false,
        this.Iconcolor = Colors.black,
        this.HintText = "",
        this.sizedboxheight = 0,
        this.paddingbottom=0,
        this.paddingright=0,
        this.paddingleft=0,
        this.paddingtop=0,
        this.onchanged,
        this.obsecure=false,
        this.suffixicon,
        this.oncompleted,
      });
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valuecontroller!,
        builder: (context, value, _){
          return Column(
            children: [
              SizedBox(
                height: sizedboxheight,
              ),
              Padding(
                padding:  EdgeInsets.only(left: paddingleft,right: paddingright,bottom: paddingbottom,top: paddingtop),
                child: TextFormField(
                  onTap: ontap,
                  onEditingComplete: oncompleted,
                    controller: textcontroller,
                  readOnly: readonly,
                  onChanged: onchanged,
                  obscureText: obsecure,
                  decoration: InputDecoration(
                      suffixIcon: suffixicon,
                      iconColor: Iconcolor,
                      hintText: HintText,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ],
          );
        });
  }
}
