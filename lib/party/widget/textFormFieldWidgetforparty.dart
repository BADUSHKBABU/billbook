import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key, required this.texteditingcontroller,
        this.width=500,
        this.height=40,
      required this.txtHead,
      this.sizedboxbottom = 0,
      this.sizedboxtop = 0,
       this.validatefunction});
  TextEditingController texteditingcontroller = TextEditingController();
  String txtHead;
  double sizedboxtop;
  double sizedboxbottom;
  double width;
  double height;
  String? Function(String?)? validatefunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(

validator: validatefunction,
            cursorHeight: 30,
            controller: texteditingcontroller,
            decoration: InputDecoration(
             // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                hintText: txtHead,
                labelStyle: const TextStyle(color: Colors.white),
                hoverColor: Colors.teal,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xff0E1D3E)))
            ),
          ),
        ),
      ],
    );
  }
}
