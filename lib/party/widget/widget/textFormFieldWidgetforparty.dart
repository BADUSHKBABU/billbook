import 'dart:async';

import 'package:billbook/party/widget/textProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class IITextEditController extends TextEditingController{
  String? Function(String?,BuildContext)? validatefunction;

  
  String Validate(BuildContext context){
    if(validatefunction==null)
    {
      return "";
      
    } 
    else
    {
      return validatefunction!(this.value.text,context)??"";
    }

  }

}

class TextFieldWidget extends StatelessWidget {
 
 String e="null ";
  IITextEditController texteditingcontroller;
  String hintText;
  double sizedboxtop;
  double sizedboxbottom;
  double width;
  double height;
  String labelString;
    bool isMandatory;
         int minLength;
         int maxLength;
         String name;
         
  String? Function(String?)? validatefunction;

  TextFieldWidget(
      {super.key, 
      this.name="",
      
      required this.texteditingcontroller,
       this.isMandatory=false,
        this.minLength=0,
        this.maxLength=250,
        this.hintText="",
        this.labelString="",
       // this.name="Designation" ,     
        this.width=500,
        this.height=40, 
      this.sizedboxbottom = 0,
      this.sizedboxtop = 0,
       this.validatefunction
       }
       )
      {
         texteditingcontroller.validatefunction=myValidator;
       }

  final StreamController<String> _streamController = StreamController<String>();

  String errorMessage="";

       String ?myValidator(String? text,BuildContext context){
        final _provider=Provider.of<TextWidgetProvider>(context,listen: false);
     
        
             String errorMessage="";

  if(isMandatory)
  {
    if(text=="")


    errorMessage="$name Cannot tbe blank".trim();
    _streamController.add(errorMessage);
    _provider.ErrorMessage(errorMessage);
    e=_provider.changeedString;
    print("errro is 1: ${_provider.changeedString}");
   
   return _provider.changeedString;
      //return errorMessage;
      //return _provider.ErrorMessage(errorMessage);
  }
  
  if(texteditingcontroller.text.length<minLength || texteditingcontroller.text.length>maxLength )
  {
    
    errorMessage="$name feild should be between $minLength and $maxLength".trim();
   // _streamController.add(errorMessage);
    _provider.ErrorMessage(errorMessage);
       e=_provider.changeedString;

   return _provider.changeedString;
      //return errorMessage;
           

  }
  if(validatefunction!=null)
  {
    errorMessage= validatefunction!(text)!;
    //_streamController.add(errorMessage);
      _provider.ErrorMessage(errorMessage);
          e=_provider.changeedString;

   return _provider.changeedString;
  // return errorMessage;
        // return _provider.ErrorMessage(errorMessage);

  }
errorMessage="";
//_streamController.add(errorMessage);
  _provider.ErrorMessage(errorMessage);
     e=_provider.changeedString;

   return _provider.changeedString;
//return errorMessage;
     // return _provider.ErrorMessage(errorMessage);


  }

  @override
  Widget build(BuildContext context) {
   

    final _provider=Provider.of<TextWidgetProvider>(context,listen: true);
   print(" of error is : ${_provider.changeedString}");
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,


          children: <Widget>[
       
            // StreamBuilder<String>(
            //   stream: _streamController.stream,
            //   initialData: "",
            //   builder: (context, errMsg) {
            //     return Column(
            //       children: [
              if(name!=""||name.isNotEmpty)
        Text(name,style: TextStyle(fontStyle: FontStyle.italic),),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            
            onEditingComplete: (){
              texteditingcontroller.validatefunction=myValidator;
            },

//validator: myValidator ,
            cursorHeight: 20,
            controller:texteditingcontroller,
            decoration: InputDecoration(

 //errorText: errMsg.data!.isEmpty ? null : errMsg.data,
  //errorText:  _provider.changeedString,
  

             // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
               // hintText: "test......${errMsg.data}",
              // hintText: _provider.changeedString,
             
                label: Text(labelString),
                labelStyle: const TextStyle(color: Colors.white),
                hoverColor: Colors.teal,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xff0E1D3E)))
            ),
          ),
          
        ),
       
         if(_provider.changeedString!="")...[Text(_provider.changeedString,style: TextStyle(color: Colors.red),)]else...[Text("")]
        //if(errorMessage!="")...[Text(errorMessage!)]
        //if(errMsg.data!="")...[Text(errMsg.data!)]
      // ],
      //           );
      //         },
      //     ),

          ]  

    );
  }
}

