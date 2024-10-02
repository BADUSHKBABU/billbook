import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/party/widget/dropdowncustomwidget/dropdownProvider.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class Iidropdownharcodedforparty extends StatefulWidget {
   final ValueNotifier<iiTransaction> controller;
  List labelstringList=[];
  double paddingleft;
  double paddingright;
  double paddingtop;
  double paddingbottom;
  double WidthOfDropdown;
  String hinttext;
  String dropdownheading;
  FontWeight fontweight;
  TextEditingController textEditingController;
  //TextEditingController searchcontroller;
   Iidropdownharcodedforparty({super.key,this.WidthOfDropdown=200,required this.controller,required this.labelstringList,this.paddingbottom=0,this.paddingleft=0,this.paddingright=0,this.paddingtop=0,
   required this.textEditingController,this.hinttext="hint text",this.dropdownheading="",this.fontweight=FontWeight.normal});
  @override
  State<Iidropdownharcodedforparty> createState() => _IidropdownharcodedState();
}

class _IidropdownharcodedState extends State<Iidropdownharcodedforparty> {
   
 late String selectedState;
 

  @override
  Widget build(BuildContext context) {
    final _provider=Provider.of<DropdownProvider>(context,listen: false);
    iiTransaction trn = iiTransaction();
    DataVehicle d = DataVehicle();

    // return ValueListenableBuilder<iiTransaction>(
    //   valueListenable: widget.controller,
    //   builder: (context, value, _) {
        return Padding(
          padding: EdgeInsets.only(
            left: widget.paddingleft,
            right: widget.paddingright,
            top: widget.paddingtop,
            bottom: widget.paddingbottom,
          ),
          child: Column(
            children: [
              Text(
                widget.dropdownheading,
                style: TextStyle(fontWeight: widget.fontweight),
              ),
              DropdownMenu(
                hintText: widget.hinttext,
                controller: widget.textEditingController,
                width: widget.WidthOfDropdown,
                  searchCallback: (entries, query) {
  if (query.isEmpty) {
    return null; // Return null if the query is empty
  } else {
    // Assuming getData is asynchronous

    _provider.data(query);

    // For now, return the index based on existing entries
    final int index = entries.indexWhere((DropdownMenuEntry<String> entry) => entry.label.contains(query));
    return index != -1 ? index : null; // Return the index or null
  }
},
                dropdownMenuEntries:
                // widget.labelstringList
                 _provider.dropDownList   .map((e) => DropdownMenuEntry<String>(value: e.toString(), label: e.toString()))
                    .toList(),
                
             

                onSelected: (value) {
                  if (value != null) {
                    setState(() {
                      selectedState = value;
                    });
                    print("Selected value: $selectedState");
                  }
                },
              ),
            ],
          ),
        );




    //   },
    // );
  }

}






