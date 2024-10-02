

import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IIColumn.dart';
import 'package:billbook/iibase/custom%20widgets/IIDropdown.dart';

import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class BillbookDropdown extends StatelessWidget {
  String label;
  double padingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  double WidthOfDropdown;
  double dropdownpaddingleft;
  TextEditingController texteditingcontroller;
  double dropdownpaddingright;
  double dropdownpaddingbottom;
  double dropdownpaddingtop;
  List<String> dropdownList;
  iTrnController valuecontroller = iTrnController(iiTransaction());
  bool isRow;
  BillbookDropdown({
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
    this.isRow=true,
    required this.texteditingcontroller
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
            textEditingController: texteditingcontroller,
              WidthOfDropdown: WidthOfDropdown,
              labelstringList: dropdownList),
        )),
      ],
    );




  }
}
