
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../transaction.dart';

class IIMultiCheck extends StatefulWidget {
  final ValueNotifier<iiTransaction> controller;
  IIMultiCheck({super.key, required this.controller});
  @override
  State<IIMultiCheck> createState() => _IIMultiCheckState();
}
class _IIMultiCheckState extends State<IIMultiCheck> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    child=ListView.builder(
        itemCount: widget.controller.value.recordCount("list"),
        itemBuilder: (context, index) {
          bool v =  widget.controller.value.getDataB("list", index, "value");
          String title =  widget.controller.value.getData("list", index, "title");
          return
            CheckboxListTile(
                title: Text(title),
                value: v,
                onChanged: (bool ?a){
                  setState(() {
                    widget.controller.value.setDataB("list", index, "value",a!);
                  });
                });
          //   ListTile(
          //     title: Text(title),
          //   );
        }
    );
    return ValueListenableBuilder<iiTransaction>
      (
      valueListenable: widget.controller,
      builder: (context, value, _)
      {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child:Container(child: child)
      );
    },
    );
  }
}



