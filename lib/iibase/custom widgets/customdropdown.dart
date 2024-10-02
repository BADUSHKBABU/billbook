import 'package:billbook/party/widget/dropdowncustomwidget/dropdownProvider.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class custondropdown extends StatefulWidget {
  const custondropdown({super.key});

  @override
  State<custondropdown> createState() => _custondropdownState();
}

class _custondropdownState extends State<custondropdown> {
  TextEditingController searchtextcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _provoder=Provider.of<DropdownProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: searchtextcontroller,
            onSubmitted: (query) {
               _provoder.data(query);
               ListView.builder(
                itemCount: _provoder.dropDownList.length,
                itemBuilder: (context,index)
               {
                return ListTile(
                   title: _provoder.dropDownList[index],
                   
                );

               });
            },
          )
        ],
      ),
    );
  }
}