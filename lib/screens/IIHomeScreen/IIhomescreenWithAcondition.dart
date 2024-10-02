import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/checkboxwidget/IICheckBox.dart';
import 'package:billbook/iibase/custom%20widgets/IIColumn.dart';
import 'package:billbook/iibase/custom%20widgets/IIRow.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/party/screen/homeparty.dart';
import 'package:billbook/user_admin/login/screen/IILoginScreen.dart';
import 'package:flutter/Material.dart';

class IIHomeScreenwithCondiion extends StatefulWidget {
  IIHomeScreenwithCondiion({super.key});

  @override
  State<IIHomeScreenwithCondiion> createState() =>
      _IIHomeScreenwithCondiionState();
}

class _IIHomeScreenwithCondiionState extends State<IIHomeScreenwithCondiion> {
  bool isLeftConatiner = false;

  TextEditingController dasboardcontroller = TextEditingController();

  iTrnController dashboardvaluecontroller = iTrnController(iiTransaction());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "satate managed copany name ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 120, 5, 5),
        leading: IconButton(
            onPressed: () {
              setState(() {
                isLeftConatiner = !isLeftConatiner;
              });
            },
            icon: Icon(Icons.arrow_back)),
        actions: [Text("state manged name")],
      ),
      body:

      
       !isLeftConatiner
          ? IIColumn(IChildren: [Text("data")])
          : 
          
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    width: 70,
                    height: MediaQuery.of(context).size.height,
                    color: Color.fromARGB(255, 109, 5, 5),
                    child: IIColumn(IChildren: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.dashboard_customize),
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                            color: Colors.white,
                          )),
                          Expanded(
                              child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.production_quantity_limits),
                            color: Colors.white,
                          )),
                          Expanded(
                              child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return Homepageforparty();
                              }));
                            },
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          ))
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                        color: Colors.white,
                      ),
                    ]),
                  ),
                  Text("data"),
                ]),
    );
  }
}
