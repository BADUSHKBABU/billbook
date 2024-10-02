import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/iibase/custom%20widgets/IIColumn.dart';
import 'package:billbook/iibase/custom%20widgets/IIContainer.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/custom%20widgets/registrationformwidgets/BillbookTextField.dart';
import 'package:flutter/Material.dart';

class IIBillBookTemplate extends StatelessWidget {
 
  List<Widget> BillbookChildren;
  String actionlabel;
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  double actionlabelfontsize;
   IIBillBookTemplate({super.key,this.actionlabelfontsize=20,required this.BillbookChildren,this.actionlabel="",this.paddingbottom=0,this.paddingleft=0,this.paddingright=0,this.paddingtop=0});

  @override
  Widget build(BuildContext context) {
    return IIContainer(Width: .8,Height: .6,containercolor: Colors.white,boxborder: true,
        Child: IIRow(IChildren: [
          Padding(
            padding: const EdgeInsets.only(top:150),
            child: IIContainer(Width: .2,Height: .4,containercolor: Colors.white,Child: Column(children: [IILabel(label: "BillBook \nBilling is made easy",color: Colors.black,fontsize: 20,),IILabel(label: actionlabel,color: Colors.blue,fontsize: actionlabelfontsize,)],),),
          ),
          Padding(
            padding:  EdgeInsets.only(left: paddingleft,right: paddingright,top: paddingtop,bottom: paddingbottom),
            child: IIContainer(Width: .5,Height: .6,boxborder: false,containercolor: Colors.white,
            Child:IIColumn(IChildren: BillbookChildren)
            ),
          )]));
  }
}