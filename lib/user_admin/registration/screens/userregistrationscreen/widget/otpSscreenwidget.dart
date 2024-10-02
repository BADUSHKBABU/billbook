import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/registration/widgets/BillbookTextField.dart';
import 'package:billbook/user_admin/registration/widgets/billbookregistrationtemplate.dart';
import 'package:flutter/Cupertino.dart';

class Otpsscreenwidget extends StatefulWidget {
  double mainpaddingbottom;
  double mainpaddingleft;
  double mainpaddingrigth;
  double mainpaddingtop;
  String Billbooktempaltelabel;
  double subpaddingbottom;
  double subpaddingtop;
  double subpaddingleft;
  double subpaddingright;
  String otplabel = "OTP";
  iTrnController valuecontroller = iTrnController(iiTransaction());
  TextEditingController otptextcontroller;
  Otpsscreenwidget(
      {super.key,
      this.mainpaddingbottom = 0,
      this.mainpaddingleft = 0,
      this.mainpaddingrigth = 0,
      this.mainpaddingtop = 0,
      this.subpaddingbottom = 0,
      this.subpaddingleft = 0,
      this.subpaddingright = 0,
      this.subpaddingtop = 0,
      this.Billbooktempaltelabel="",
      this.otplabel="OTP",
      required this.otptextcontroller,
      required this.valuecontroller});

  @override
  State<Otpsscreenwidget> createState() => _OtpsscreenwidgetState();
}

class _OtpsscreenwidgetState extends State<Otpsscreenwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IIBillBookTemplate(
          paddingbottom: widget.mainpaddingbottom,
          paddingleft: widget.mainpaddingleft,
          paddingright: widget.mainpaddingtop,
          paddingtop: widget.mainpaddingtop,
          actionlabel: widget.Billbooktempaltelabel,
          BillbookChildren: [
            BillbookTextFieldWidget(
              paddingbottom: widget.subpaddingbottom,
              paddingright: widget.subpaddingright,
              paddingtop: widget.subpaddingtop,
              padingleft: widget.subpaddingleft,
              label: widget.otplabel,
              textEditingController: widget.otptextcontroller,
              valuecontroller: widget.valuecontroller,
            ),
          ])
    ]);
  }
}
