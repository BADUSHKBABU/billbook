

import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIColumn.dart';
import 'package:billbook/iibase/custom%20widgets/IIDropdown.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';

class BillbookDropdown extends StatelessWidget {
  String label;
  double padingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  double WidthOfDropdown;
  double dropdownpaddingleft;
  double dropdownpaddingright;
  double dropdownpaddingbottom;
  double dropdownpaddingtop;
  List<String> dropdownList;
  TextEditingController textedittingcontroller;
  iTrnController valuecontroller = iTrnController(iiTransaction());
  bool isRow;
  BillbookDropdown({
    required this.textedittingcontroller,
    this.dropdownpaddingbottom = 0,
    this.dropdownpaddingleft = 0,
    this.dropdownpaddingright = 0,
    this.dropdownpaddingtop = 0,
    this.WidthOfDropdown = 200,
    required this.label,
    required this.valuecontroller,
    this.paddingbottom = 0,
    this.paddingright = 0,
    this.paddingtop = 0,
    this.padingleft = 0,
    required this.dropdownList,
    this.isRow=true
  });

  @override
  Widget build(BuildContext context) {
    return IIRow(
      IChildren: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: IILabel(
            label: label,
            textAlign: TextAlign.center,
            fontsize: 15,
            color: Colors.black,
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(
              left: dropdownpaddingleft,
              right: dropdownpaddingright,
              bottom: dropdownpaddingbottom,
              top: dropdownpaddingbottom),
          child: Iidropdownharcoded(
            textEditingController:textedittingcontroller,
              WidthOfDropdown: WidthOfDropdown,
              labelstringList: dropdownList),
        )),
      ],
    );




  }
}
