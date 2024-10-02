


import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/party/widget/multicheckbocforBillbook/multichecprovider.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class IIMultiCheckforBillbookParty extends StatefulWidget {
  final ValueNotifier<iiTransaction> controller;
  double height;
  double width;
  Axis direction;
  IIMultiCheckforBillbookParty(
      {super.key,
        required this.controller,
        required this.width,
        required this.height,
        required this.direction });
  @override
  State<IIMultiCheckforBillbookParty> createState() => _IIMultiCheckforBillbookPartyState();
}

class _IIMultiCheckforBillbookPartyState extends State<IIMultiCheckforBillbookParty> {
  var isCustomer=1;
  var isTransporter=2;
  var isManufaturer=4;
  var isSupplier=8;
  String thevalue="";var s=0;
  var n=0;
   List<String> checkboxLabels = ["Customer", "Manufacturer", "Supplier", "Transporter"];
   List<int> checkboxValues = [1, 2, 4, 8];  
   int totalValue = 0;
    @override
  void initState() {
  super.initState();
  
  for (int i = 0; i < checkboxLabels.length; i++) {
  widget.controller.value.setDataB("list", i, "value", false);  
  widget.controller.value.setData("list", i, "title", checkboxLabels[i]); 
  }
  }


  @override
  Widget build(BuildContext context) {
      final _provider=Provider.of<multicheckprovider>(context,listen: false);
    Widget child;
    child = ListView.builder(

        scrollDirection: widget.direction,
        itemCount: widget.controller.value.recordCount("list"),
        itemBuilder: (context, index) {
          bool v = widget.controller.value.getDataB("list", index, "value");
          String title =widget.controller.value.getData("list", index, "title");
          int checkboxValue = checkboxValues[index];
          return
            Container(width: widget.width,
            height: widget.height,
            child:
            CheckboxListTile(
                  title: Text(title),
                  value: v,
                  onChanged: (bool? a) {
                    setState(() {


                      widget.controller.value.setDataB("list", index, "value", a!);
                      updateTotalValue(a, checkboxValue,BuildContext);  

                    });
                  }),
            );

        });
    return ValueListenableBuilder<iiTransaction>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        return Container(
          child: child,
        );
      },
    );
  }
  void updateTotalValue(bool isChecked, int value,BuildContext) {
  setState(() {
  if (isChecked) {
  totalValue += value;
  } else 
  {
  totalValue -= value;
  }
  });
  print("tatal value is : $totalValue");//send totalvalue to backend
  final _provider=Provider.of<multicheckprovider>(context,listen: false);
  _provider.valuechange(totalValue);

  }
}