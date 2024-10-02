import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Numerictextfield extends StatefulWidget {
   Numerictextfield({super.key, required this.numericcontroller,this.hinttext="",this.width=500,this.height=40,this.validatefunction});
   TextEditingController numericcontroller=TextEditingController();
   String hinttext;
   double width;
   double height;
   String? Function(String?)? validatefunction;


  @override
  State<Numerictextfield> createState() => _NumerictextfieldState();
}

class _NumerictextfieldState extends State<Numerictextfield> {

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(cursorHeight: 20,
            validator:widget.validatefunction ,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller:widget.numericcontroller,
            decoration: InputDecoration(
                hintText: widget.hinttext,
                labelStyle: const TextStyle(color: Colors.white),

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
