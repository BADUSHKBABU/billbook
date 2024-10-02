import 'package:flutter/Cupertino.dart';

class IIColumn extends StatelessWidget {
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  List <Widget> IChildren=[];
  IIColumn(
      {super.key,
      this.paddingbottom = 0,
      this.paddingtop = 0,
      this.paddingright = 0,
      this.paddingleft = 0,
      required this.IChildren});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingleft,
          right: paddingright,
          bottom: paddingbottom,
          top: paddingtop),
      child: Column(
        children: IChildren,
      ),
    );
  }
}
