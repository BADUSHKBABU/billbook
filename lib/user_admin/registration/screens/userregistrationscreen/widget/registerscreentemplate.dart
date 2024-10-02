import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/custom%20widgets/IiOKMessage.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/IIRegistrationScreen2.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/widget/buttonwidget.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';

class RegisterScreenTemplate extends StatefulWidget {
  double mainpaddingleft;
  double mainpaddingrigth;
  double mainpaddingtop;
  double mainpaddingbottom;
  double subpaddingtop;
  double subpaddingbottom;
  double subpaddingright;
  double subpaddingleft;
  String firstTextFieldheading;
  String secondtextfieldheading;
  String Billbooktempaltelabel;
  String hintText;
  double outerpaddingleft;
  double outerpaddingright;
  double outerpaddingtop;
  double outerpaddingbottom;
  bool isNormalField;
 // Widget button;
  iTrnController valuecontroller = iTrnController(iiTransaction());
  TextEditingController firsttextEditingController;
  TextEditingController secondtextEditingController;
  String okmessagelabel;
  bool obsecurepassword;
  //String Buttonlabel;
 // Widget navigatorwidget;
  RegisterScreenTemplate(
      {
        this.isNormalField=true,
        //required this.button,
        required this.okmessagelabel,
       // required this.Buttonlabel,
        this.outerpaddingbottom=0,
        this.outerpaddingleft=0,
        this.outerpaddingright=0,
      this.outerpaddingtop=90,
      this.subpaddingbottom = 0,
      this.subpaddingleft = 0,
      this.subpaddingright = 0,
      this.subpaddingtop = 0,
      this.Billbooktempaltelabel = "",
      required this.firstTextFieldheading,
      required this.secondtextfieldheading,
      this.hintText = "",
      super.key,
      this.mainpaddingbottom = 0,
      this.mainpaddingleft = 0,
      this.mainpaddingrigth = 0,
      this.mainpaddingtop = 90,
      this. obsecurepassword=false,
      required this.firsttextEditingController,
      required this.secondtextEditingController,
     // required this.navigatorwidget,
      required this.valuecontroller});

  @override
  State<RegisterScreenTemplate> createState() => _RegisterScreenTemplateState();
}

class _RegisterScreenTemplateState extends State<RegisterScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:  EdgeInsets.only(left:widget.outerpaddingleft ,right: widget.outerpaddingright,bottom: widget.outerpaddingbottom,top: widget.outerpaddingtop),
        child: IIBillBookTemplate(
          paddingbottom: widget.mainpaddingbottom,
          paddingleft: widget.mainpaddingleft,
          paddingright: widget.mainpaddingrigth,
          paddingtop: widget.mainpaddingtop,
          actionlabel: widget.Billbooktempaltelabel,
          BillbookChildren: [
            if(widget.isNormalField==true)...[
            BillbookTextFieldWidget(
              label: widget.firstTextFieldheading,
              textEditingController: widget.firsttextEditingController,
              valuecontroller: widget.valuecontroller,
              //obsecurepassword: widget.obsecurepassword,
            ),
            BillbookTextFieldWidget(
              paddingbottom:widget.subpaddingbottom ,
              paddingright: widget.subpaddingright,
              paddingtop: widget.subpaddingtop,
              padingleft: widget.subpaddingleft,
              hintText: widget.hintText,
             // obsecurepassword: widget.isNormalField,
              label: widget.secondtextfieldheading,
              textEditingController: widget.secondtextEditingController,
              valuecontroller: widget.valuecontroller,
            ),]
            else...[
              BillbookTextFieldWidget(
                obsecurepassword: widget.obsecurepassword,
              label: widget.firstTextFieldheading,
              textEditingController: widget.firsttextEditingController,
              valuecontroller: widget.valuecontroller,
              suffixicon: widget.obsecurepassword?
              IconButton(onPressed: (){
                setState(() {
                  widget.obsecurepassword=!widget.obsecurepassword;
                });
              }, icon: Icon(Icons.visibility_off_sharp))
              :
              IconButton(onPressed: (){
                setState(() {
                  widget.obsecurepassword=!widget.obsecurepassword;
                });
              }, icon: Icon(Icons.visibility_sharp)),
            ),
            BillbookTextFieldWidget(
              obsecurepassword:widget.obsecurepassword,
              paddingbottom:widget.subpaddingbottom ,
              paddingright: widget.subpaddingright,
              paddingtop: widget.subpaddingtop,
              padingleft: widget.subpaddingleft,
             // hintText: widget.hintText,
              label: widget.secondtextfieldheading,
              textEditingController: widget.secondtextEditingController,
              valuecontroller: widget.valuecontroller,
               suffixicon: widget.obsecurepassword?
              IconButton(onPressed: (){
                setState(() {
                  widget.obsecurepassword=!widget.obsecurepassword;
                });
              }, icon: Icon(Icons.visibility_off_sharp))
              :
              IconButton(onPressed: (){
                setState(() {
                  widget.obsecurepassword=!widget.obsecurepassword;
                });
              }, icon: Icon(Icons.visibility_sharp)),
            )
            ]

          
          ],
        ),
      ),
      
    ]);
  }
}

