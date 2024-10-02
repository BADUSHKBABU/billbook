import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class Iidropdownharcoded extends StatefulWidget {
  List<String> labelstringList=[];
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  double WidthOfDropdown;
  TextEditingController textEditingController;
  //TextEditingController searchcontroller;
   Iidropdownharcoded({super.key,this.WidthOfDropdown=200,required this.labelstringList,this.paddingbottom=0,this.paddingleft=0,this.paddingright=0,this.paddingtop=0,
   required this.textEditingController});
  @override
  State<Iidropdownharcoded> createState() => _IidropdownharcodedState();
}

class _IidropdownharcodedState extends State<Iidropdownharcoded> {
 late String selectedState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:widget.paddingleft ,right:widget.paddingright ,top:widget.paddingtop ,bottom:widget.paddingbottom ),
      child: DropdownMenu(
        controller: widget.textEditingController,
        width:widget.WidthOfDropdown ,
        dropdownMenuEntries:widget.labelstringList.map((e)=>DropdownMenuEntry(value: e, label: e)).toList(),
       onSelected: (value){
        if(value!=null){
          selectedState=value;
          print("selected value $selectedState");
        }
       },
      ),
    );
  }
}