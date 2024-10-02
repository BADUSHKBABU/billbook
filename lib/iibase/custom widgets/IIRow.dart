import 'package:flutter/Cupertino.dart';

class IIRow extends StatelessWidget {
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  List<Widget> IChildren;
   IIRow({super.key,this.paddingtop=0,this.paddingbottom=0,this.paddingright=0,this.paddingleft=0,required this.IChildren});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:paddingleft ,right:paddingright ,top:paddingtop ,bottom:paddingbottom ),
      child: Row(
        children: IChildren,
      ),
    );
  }
}
