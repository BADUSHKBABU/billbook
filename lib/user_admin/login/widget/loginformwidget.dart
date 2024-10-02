import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/IITextEditingcontroller.dart';
import 'package:billbook/iibase/custom%20widgets/IiLabel.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:billbook/user_admin/registration/screens/userregistrationscreen/screen/iiregistrationscreen1.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import '../../../iibase/custom widgets/IIColumn.dart';
import '../../../iibase/custom widgets/IIRow.dart';

class loginwidget extends StatelessWidget {
  String label;
  bool obsecure;
  bool isPasswordField;
  double fontsize;
  TextEditingController texteditingcontroller=TextEditingController();
  iTrnController valuecontroller=iTrnController(iiTransaction());
   loginwidget({super.key,required this.label,this.obsecure=false,required this.isPasswordField,this.fontsize=20,required this.texteditingcontroller});

  @override
  Widget build(BuildContext context) {
   // final _loginprovider=Provider.of<loginService>(context,listen:  false);
    return  
                      IIRow(paddingleft: 200,
                        IChildren:[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: IILabel(
                              label:label,
                              textAlign: TextAlign.center,
                              fontsize: fontsize,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: isPasswordField?IITextEditingController(
                              textEditingController: texteditingcontroller,
                              sizedboxheight: 30,
                              paddingright: 20,
                              paddingleft: 50,
                              controller:valuecontroller,
                              obsecure:obsecure ,
                              suffixicon: IconButton(onPressed: (){
                                obsecure=!obsecure;
                              }, icon: obsecure?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                            ):IITextEditingController(
                              textEditingController: texteditingcontroller,
                              sizedboxheight: 30,
                              paddingright: 20,
                              paddingleft: 50,
                              controller:valuecontroller,
                            ),
                          ),

                        ],
                      );
                     
                      
                    

                  
  }
}