import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
///by default Text in button is null,
///onpress and child are required field ,
class IIButton extends StatelessWidget {
  void Function() onpress;
  String label;
  Color  bgcolor;
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  Widget Child;
  IIButton({super.key, required this.onpress, this.label = "", this.bgcolor=Colors.white10,this.paddingbottom=0,this.paddingtop=0,this.paddingright=0,this.paddingleft=0,required this.Child});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding:  EdgeInsets.only(right: paddingright,left: paddingleft,top:paddingtop ,bottom: paddingbottom),
      child: ElevatedButton(onPressed: onpress, child: Child,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(bgcolor)),
    ));
  }
}
