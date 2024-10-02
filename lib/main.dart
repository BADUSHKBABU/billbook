import 'package:billbook/iibase/custom%20widgets/GRID/iigrid.dart';
import 'package:billbook/iibase/custom%20widgets/checkboxwidget/checkboxprovider.dart';
import 'package:billbook/iibase/custom%20widgets/customdropdown.dart';
import 'package:billbook/party/buisness%20logic/gridprovider.dart';
import 'package:billbook/party/screen/partyscreen.dart';
import 'package:billbook/party/widget/dropdowncustomwidget/dropdownProvider.dart';
import 'package:billbook/party/widget/multicheckbocforBillbook/multichecprovider.dart';
import 'package:billbook/party/widget/service/table/tableprovider.dart';
import 'package:billbook/party/widget/textProvider.dart';
import 'package:billbook/user_admin/login/screen/IILoginScreen.dart';
import 'package:billbook/user_admin/login/services/loginservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserRegisterService()),
        ChangeNotifierProvider(create: (_)=>multicheckprovider()), //to take the values of checked box for seding to backend
        ChangeNotifierProvider(create: (_)=>Gridprovider()),   ///for the taking rows
        ChangeNotifierProvider(create: (_)=>checkboxprovider()) , //for checkbox, billing diasble
        ChangeNotifierProvider(create: (_)=>TextWidgetProvider()),//it is for passing error value ,used in TextWidget
        ChangeNotifierProvider(create: (_)=>Tableprovider())   ,//
        ChangeNotifierProvider(create: (_)=>DropdownProvider()),//for dropdowndata , operation nor able to handle in dropdown custom widget, this provider habndles asynchronous operation for sending and receiving data
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
      
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
        home: custondropdown()
        
        // IILoginScreen(),
      ),
    );
  }
}

