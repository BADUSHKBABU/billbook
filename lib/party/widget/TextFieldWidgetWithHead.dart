import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgetWithHead extends StatelessWidget {
  TextWidgetWithHead({super.key, required this.texteditingcontroller,required this.txtHead,this.hintText="",this.validatefunction});
  TextEditingController texteditingcontroller = TextEditingController();
  String txtHead;
  String hintText;
  String? Function(String?)? validatefunction;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(txtHead,textAlign: TextAlign.start,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),const SizedBox(height: 10,),
        SizedBox(
          width: 500,
          height: 40,
          child: TextFormField(
            validator: validatefunction,
            controller: texteditingcontroller,
            decoration: InputDecoration(
             // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: hintText,
              hoverColor: Colors.teal,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xff0E1D3E)))),
          ),
        ),
      ],
    );
  }
}
