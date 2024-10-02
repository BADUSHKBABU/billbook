import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

class BillbookTextFieldWidget extends StatefulWidget {
  TextEditingController textEditingController=TextEditingController();
  String label;
  double padingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  String hintText;
  TextInputType keyboardmode;
  bool obsecurepassword;
  bool isiconNeeded;
  IconButton? suffixicon;
  iTrnController valuecontroller=iTrnController(iiTransaction());
   BillbookTextFieldWidget({required this.label,this.suffixicon=null,this.obsecurepassword=false,this.isiconNeeded=false,required this.textEditingController,required this.valuecontroller,this.paddingbottom=0,this.paddingright=0,this.paddingtop=0,this.padingleft=0,this.hintText="",this.keyboardmode=TextInputType.name});

  @override
  State<BillbookTextFieldWidget> createState() => _BillbookTextFieldWidgetState();
}

class _BillbookTextFieldWidgetState extends State<BillbookTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  IIRow(
                            IChildren: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20, top: 20, right: 20),
                                child: IILabel(
                                  label: widget.label,
                                  textAlign: TextAlign.center,
                                  fontsize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: IITextEditingController(
                                  obsecure: widget.obsecurepassword,
                                 // keyboardtype:widget.keyboardmode,
                                  textEditingController: widget.textEditingController,
                                  sizedboxheight: 30,
                                  paddingright: 20,
                                  paddingleft: 50,
                                  controller:widget.valuecontroller,
                                  HintText: widget.hintText,
                                   suffixicon:widget.suffixicon
                                ),
                              ),
                            ],
                          );
  }
}
