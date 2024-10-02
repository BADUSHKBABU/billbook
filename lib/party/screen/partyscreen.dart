import 'dart:math';

import 'package:billbook/iibase/controllers/BoolController.dart';
import 'package:billbook/iibase/controllers/IITRN.dart';
import 'package:billbook/iibase/custom%20widgets/GRID/iigrid.dart';
import 'package:billbook/iibase/custom%20widgets/checkboxwidget/IICheckBox.dart';
import 'package:billbook/iibase/custom%20widgets/IImultiCheckbox.dart';
import 'package:billbook/iibase/custom%20widgets/checkboxwidget/checkboxprovider.dart';
import 'package:billbook/iibase/datavehicle.dart';
import 'package:billbook/iibase/transaction.dart';
import 'package:billbook/party/buisness%20logic/gridprovider.dart';
import 'package:billbook/party/widget/IITextEditingcontrollerforparty.dart';
import 'package:billbook/party/widget/pluttogrid.dart';
import 'package:billbook/party/widget/service/table/table.dart';
import 'package:billbook/party/widget/service/table/tableprovider.dart';
import 'package:billbook/party/widget/service/validatefields.dart';
import 'package:billbook/party/widget/dropdowncustomwidget/IIDropdownforparty.dart';
import 'package:billbook/party/widget/multicheckbocforBillbook/IImultiCheckboxBillBookforparty.dart';
import 'package:billbook/party/widget/TextFieldWidgetWithHead.dart';
import 'package:billbook/party/widget/billbooktabwidget.dart';
import 'package:billbook/party/widget/multicheckbocforBillbook/multichecprovider.dart';
import 'package:billbook/party/widget/numerictextFieldforparyt.dart';

import 'package:billbook/party/widget/widget/textFormFieldWidgetforparty.dart';
import 'package:flutter/Cupertino.dart';

import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import '../../iibase/custom widgets/IiOKMessage.dart';



//Temporory disabled scrollview {commented , dont remove any commented code }


class Partyscreen extends StatefulWidget {
 // final ScrollController scrollController;
  bool isParty;
  Partyscreen(
      {super.key,
      // required this.scrollController, 
       required this.isParty});
  @override
  State<Partyscreen> createState() => _PartyscreenState();
}

class _PartyscreenState extends State<Partyscreen> {
  bool CanclearRow=false;
  bool isSaveButtonPressed=false;//for triggering function in table class to reset its rows
  
   iTrnController searchtextRoutecontroller = iTrnController(iiTransaction());
    iTrnController searchtextStatecontroller = iTrnController(iiTransaction());
     iTrnController searchbillingstatecontroller = iTrnController(iiTransaction());
      iTrnController searchshippingststecontroller= iTrnController(iiTransaction());
       iTrnController valueregistercontroller= iTrnController(iiTransaction());
   iTrnController valuecontrollerFortextbox = iTrnController(iiTransaction());
  iTrnController multicheckboxcontroller = iTrnController(iiTransaction());
    BoolController disablebillingcontroller=BoolController(false);
IITextEditController textemailcontroller=IITextEditController();
  IITextEditController emailcontroller = IITextEditController();
  IITextEditController txtName = IITextEditController();
  IITextEditController designationcontroller = IITextEditController();
  IITextEditController workmobilecontroller = IITextEditController();
  IITextEditController whatsappnumber = IITextEditController();
  IITextEditController gstcontroller = IITextEditController();
  IITextEditController pancontroller = IITextEditController();
  IITextEditController statecontroller = IITextEditController();
  IITextEditController typecontroller = IITextEditController();
  IITextEditController billingaddresscontroller = IITextEditController();
  IITextEditController shippingaddresscontroller = IITextEditController();
  IITextEditController billinglocation = IITextEditController();
  IITextEditController shippinglocation = IITextEditController();
  IITextEditController billingpin = IITextEditController();
  IITextEditController shippingpin = IITextEditController();
  IITextEditController billingstatecontroller = IITextEditController();
  IITextEditController shippingstatecontroller = IITextEditController();
  IITextEditController accountnamecontroller = IITextEditController();
  IITextEditController accountnumbercontroller = IITextEditController();
  IITextEditController banknamecontroller = IITextEditController();
  IITextEditController branchnamecontroller = IITextEditController();
  IITextEditController ifsccontroller = IITextEditController();
  IITextEditController creditNoOfdays = IITextEditController();
  IITextEditController creditlimit = IITextEditController();
  IITextEditController routecontroller = IITextEditController();
IITextEditController contactpersonnamecontroller=IITextEditController();
  IITextEditController creditNo = IITextEditController();
IITextEditController leagalnamecontroller=IITextEditController();
  IITextEditController partynamecontroller = IITextEditController();
  IITextEditController noofcreditcontroller = IITextEditController();
  IITextEditController billingsiablemessagecontroller = IITextEditController();
  IITextEditController partytypecontroller = IITextEditController();
 
  IITextEditController billDatecontrollergrid = IITextEditController();
  IITextEditController creditdayscontrollergrid = IITextEditController();
  IITextEditController billnumbercontrollergrid = IITextEditController();
  IITextEditController payableamountcontrollergrid = IITextEditController();
  IITextEditController slnumbercontrollergrid = IITextEditController();
  IITextEditController receivableamountcontrollergrid =IITextEditController();

//declare variable for store transguid
String savetransguid="";
//decalring variable for updatecount
String updatecount="";
//declaring variable for saving id , party_id in party_opening is same as id in party
String id="";
//declaring variable for branch id in party opening
String br_idParty_opening="";
 
  final _formkey = GlobalKey<FormState>();
  DataVehicle d = DataVehicle();
  PlutoGridtable _plutoGridtable=PlutoGridtable();
  late  List<PlutoColumn> columns ;
    PlutoGridAdapter ?tblOpening;
  

  @override
  void initState() {
    Map icheckboxlabel = {
      "Customer": 1,
      "manufacturer": 2,
      "Supplier": 4,
      "Transporter": 8
    };
    List checkboxlabel = ["customer", "manufaturer", "supplier", "transporter"];
    for (int i = 0; i < 4; i++) {
      multicheckboxcontroller.value.setDataB("list", i, "title", false);
      multicheckboxcontroller.value
          .setData("list", i, "title", checkboxlabel[i]);
    }


    super.initState();

    columns= <PlutoColumn>[

    PlutoColumn(
      enableFilterMenuItem: false,
      backgroundColor: Colors.yellow,
      enableRowDrag: true,
      title: "sl no",
      field: 'sl no',
      type: PlutoColumnType.number(defaultValue: 0),
    ),
    PlutoColumn(
      title: 'Bill date',
      field: 'Bill date',
      type: PlutoColumnType.date(),
    ),
    PlutoColumn(
      title: 'Bill no',
      field: 'Bill no',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Credit days',
      field: 'Credit days',
      type: PlutoColumnType.date()
    ),
    PlutoColumn(
      frozen: PlutoColumnFrozen.none,
      title: 'Receivable amount',
      field: 'Receivable amount',
      type: PlutoColumnType.currency(format: "₹"),
    ),
    PlutoColumn(
      title: 'Payable amount',
      field: 'Payable amount',
      type: PlutoColumnType.currency(format: "₹"),
    ),

   
  ];


// Adding a post frame callback to perform actions after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
    });


  
  }

  void addColumn(PlutoGridStateManager  stateManager, String title,String field,PlutoColumnType datatype){
    final newColumn =
    PlutoColumn(title:title, field: field, type: datatype);
    // Insert the new row at the bottom
    stateManager.insertColumns(
        stateManager.columns.length, [newColumn]); // Inserts at the bbottom

}

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<multicheckprovider>(context, listen: false);
    final _providerbillingcheckbox=Provider.of<checkboxprovider>(context,listen: false);
    
    ValidateFields validateFields = ValidateFields();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("PARTY"),
                Container(
                  child: Row(
                    children: [
                      IconButton(

                        tooltip: "Save Data",
                       
                          onPressed:()  {
                          setState(()  async{
                              isSaveButtonPressed=true;//for passing to table class to remove entire row 
                    
                                List<String> msg=[];
                          //    msg.add(txtName.validate());
                                txtName.Validate(context);
                               // if(msg==null){
                               //   showDialog(context: context, builder: (ctx){return IIOkMessage(label: "validation success",);});
                              //  }
                              //  else{
                                //showDialog(context: context, builder: (ctx){return IIOkMessage(label: msg);});
                                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: Duration(seconds: 6),));
                              //  }// bool validd= _formkey.currentState!.validate();//needed one
                              bool validd =
                                  true; //temporoy, nemove ater testing
                              print(validd);
                             
                              if (validd == true) {
                             
                                print("true , data passing ");
                                String valueofmulticheck =
                                    _provider.value.toString();

                                iiTransaction trn = iiTransaction();
                                trn.setData(
                                    "party", 0, "email", emailcontroller.text);
                                trn.setData("party", 0, "legal_name", leagalnamecontroller.text);
                                // _providerbillingcheckbox.ValuetoBeSend(v)
                                if(disablebillingcontroller.value==true)
                                  trn.setData("party", 0, "disable_billing", "1");
                                  else{
                                    trn.setData("party", 0, "disable_billing", "0");}
                                trn.setData("party", 0, "name",
                                    txtName.text);
                                trn.setData("party", 0, "party_type",
                                    valueofmulticheck);
                                trn.setData("party", 0, "contact_person",
                                    contactpersonnamecontroller.text);
                                trn.setData("party",0,"contact_person_designation",
                                    designationcontroller.text);
                                trn.setData("party", 0, "contact_person_phoneno",
                                    workmobilecontroller.text);
                                trn.setData(
                                    "party", 0, "gstin", gstcontroller.text);
                                trn.setData(
                                    "party", 0, "pan", pancontroller.text);
                                trn.setData("party", 0, "stateid",
                                    statecontroller.text);
                                trn.setData("party", 0, "billing_address",
                                    billingaddresscontroller.text);
                                trn.setData("party", 0, "shipping_address",
                                    shippingaddresscontroller.text);
                                trn.setData("party", 0, "billing_location",
                                    billinglocation.text);
                                trn.setData("party", 0, "shippinglocation",
                                    shippinglocation.text);
                                trn.setData("party", 0, "billing_pincode", billingpin.text);
                                trn.setData("party", 0, "shipping_location",shippinglocation.text);
                                trn.setData("party", 0, "registration_type",typecontroller.text);
                                trn.setData("party", 0, "shipping_pincode",shippingpin.text);
                                    trn.setData("party", 0, "disable_billing_message", billingsiablemessagecontroller.text);
                                trn.setData("party", 0, "billing_stateid",
                                    billingstatecontroller.text);
                                trn.setData("party", 0, "shipping_stateid",
                                    shippingstatecontroller.text);
                                trn.setData("party", 0, "bank_acc_name",
                                    accountnamecontroller.text);
                                trn.setData("party", 0, "bank_acc_no",
                                    accountnumbercontroller.text);
                                trn.setData("party", 0, "bank_acc_bank_name",
                                    banknamecontroller.text);
                                trn.setData("party", 0, "bank_acc_branch",
                                    branchnamecontroller.text);
                                trn.setData("party", 0, "bank_acc_ifsc",
                                    ifsccontroller.text);
                                trn.setData("party", 0, "credit_days",
                                    creditNoOfdays.text);
                                    trn.setData("party", 0, "credit_limit",
                                    creditlimit.text);
                                    trn.setData("party", 0, "no_of_credit",
                                    noofcreditcontroller.text);
                                trn.setData(
                                    "party", 0, "route", routecontroller.text);
                                    //passing transguid for exixting party
                                    if(savetransguid==""){
                                    trn.setData("party", 0, "transguid", "${Random().nextInt(100)}");
                                    }
                                    else{
                                      trn.setData("party", 0, "transguid", savetransguid);
                                    }
                                    //passing id for an existing party
                                    if(id!=""||id.isNotEmpty){
                                      trn.setData("party", 0, "id", id);
                                    }
                                    else{
                                      trn.setData("party", 0, "id", "");
                                    }

                                    //passing update count for existing party
                                    if(updatecount!=""||updatecount.isNotEmpty)
                                    {
                                      trn.setData("party", 0, "updatecount", updatecount);
                                    }
                                    else 
                                    {
                                      trn.setData("paty", 0, "updatecount", "");
                                    }
                                trn.setData(
                                    "party", 0, "creditno", creditNo.text);
                                    trn.setData("party", 0, "createdbyid", "1");
                                    

                                                    //opening table   
                                    
                                    //it need to handle null error , tableopening might be null , before using it check null condition 
if(tblOpening!=null)
{
                                  int cnt=tblOpening!.RowCount();
                                  print("row count : $cnt");
                                  for(int i=0;i<cnt;i=i+1)
                                  { 
                                    //trn.setData("party_opening",i,"slno","${i+1}");
                                  if(tblOpening!.getData(i, "bill date")!=""|| tblOpening!.getData(i, "bill date")=="2000-01-02"){
                                    trn.setData("party_opening",i,"bill_date",tblOpening!.getData(i, "bill date"));
                                    trn.setData("party_opening",i,"bill_no",tblOpening!.getData(i, "bill no"));
                                    trn.setData("party_opening",i,"credit_days",tblOpening!.getData(i, "credit days"));
                                    trn.setData("party_opening",i,"receivable_payable_amount",tblOpening!.getData(i, "receivable amt"));  
                                    if(id==""||id.isEmpty)
                                    {
                                      trn.setData("paty_opening", 0, "party_id", "");
                                    }       
                                    else
                                    {
                                      trn.setData("part_name", 0, "party_id", id);
                                    } 
                                    if(br_idParty_opening==""||br_idParty_opening.isNotEmpty)   
                                    {
                                      trn.setData("party_opening", i, "branchid", br_idParty_opening);
                                    }                      
                                    //trn.setData("party_opening", i, "branchid", "${i+1}");
                                    }
                                  }
                                    
}
else{
   
                                    trn.setData("party_opening",0,"bill_date",tblOpening!.getData(0, "0"));
                                    trn.setData("party_opening",0,"bill_no",tblOpening!.getData(0, "0"));
                                    trn.setData("party_opening",0,"credit_days",tblOpening!.getData(0, "0"));
                                    trn.setData("party_opening",0,"receivable_payable_amount",tblOpening!.getData(0, "0"));  
                                    if(id==""||id.isEmpty)
                                    {
                                      trn.setData("paty_opening", 0, "party_id", "");
                                    }       
                                    else
                                    {
                                      trn.setData("part_name", 0, "party_id", "");
                                    } 
                                    if(br_idParty_opening!=""||br_idParty_opening.isNotEmpty)   
                                    {
                                      trn.setData("party_opening", 0, "branchid", br_idParty_opening);
                                    }                      
                                    //trn.setData("party_opening", i, "branchid", "${i+1}");
                                    

}
                                    ///clear all text fields
                                     txtName.clear();
                                  banknamecontroller.clear();
                                  emailcontroller.clear();


                                  ///clear all the row

                                  tblOpening!.RemoveAllRow();
                                  

                                  //passing the bool value  to the table class 
                                  final _providertable=Provider.of<Tableprovider>(context,listen: false);
                                  _providertable.chehcking_save_button(isSaveButtonPressed);

                                  tablwwidget _tble=tablwwidget();
                                
                                  //console print for  testing 
                                     print("full data is :${trn.toJSON()}");
                                iiTransaction resultparty = await d.getData("masters.party.savevendor", trn);
                        
                                print("incoming data is : ${resultparty.getData("party", 0, "bank_acc_ifsc")}");
                                print("update count:${resultparty.getData("party", 0, "updatecount")}");


                           
                             

                      
 Map<int, Map<String, dynamic>> dataMap = {};
 print("record count at server :${resultparty.recordCount("party_opening")}");

for (int i = 0; i < (resultparty.recordCount("party_opening")!); i++) {
 
 int slno = i; 
  String billDate = resultparty.getData("party_opening", i, "bill_date");
  String billNo = resultparty.getData("party_opening", i, "bill_no");
  String creditDays = resultparty.getData("party_opening", i, "credit_days");
  String receivablePayableAmount = resultparty.getData("party_opening", i, "receivable_payable_amount");

  
  dataMap[slno] = {
    //  "sl no":slno,
    'bill date': billDate,
    'bill no': billNo,
    'credit days': creditDays,
    'receivable amt': receivablePayableAmount,
    "payable amount":receivablePayableAmount
  };
}
print("map from server is : $dataMap");
                                 

for(int i=0;i<resultparty.recordCount("party_opening")!;i++)
{
  tblOpening!.setData(i,"bill date",dataMap[i]!["bill date"]);
//  tblOpening!.setData(i,"sl no",dataMap[i]!["sl no"]);
 tblOpening!.setData(i,"bill no",dataMap[i]!["bill no"]);
  tblOpening!.setData(i,"credit days",dataMap[i]!["credit days"]);
  tblOpening!.setData(i,"receivable amt",dataMap[i]!["receivable amt"]);
  tblOpening!.setData(i,"payable amount",dataMap[i]!["payable amount"]);
  //tblOpening.setData(i,"sl no",dataMap[i]!["sl no"]);
}

                              
    tblOpening!.updateGrid(); 
                       
                      

                                final response =resultparty.getData("result", 0, "type");
                                if (resultparty.getData("result", 0, "message") == "Success") {   

                                  /// tranguid , id and updatecount need for updating existing user , save these values came from server and reuse it for further update                            
                                  //saving incomming transguid to a variable , 
                                  savetransguid=resultparty.getData("party", 0, "transguid");
                                  //saving incomming updatecount to a variable 
                                  updatecount=resultparty.getData("party", 0 , "updatecount");
                                  //saving incoming id to a variable
                                  id=resultparty.getData("party", 0, "id");
                                  print("id from server is :$id");
                                // fill the textfield with th data frm server , 
                                  txtName.text=resultparty.getData("party", 0, "name");



                                  String error =resultparty.getData("result", 0, "message");
                                  
                                 
                        

                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return IIOkMessage(label: error);
                                      });
                                      CanclearRow=!CanclearRow;
                                      print(CanclearRow);

                                    
                                  Navigator.pop(context);
                                }
                                if (response == "-2") {
                                  String error =
                                      resultparty.getData("result", 0, "message");

                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return IIOkMessage(label: error);
                                      });
                                } else if (response == "-1") {
                                  String error =
                                      resultparty.getData("result", 0, "message");
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return IIOkMessage(label: error);
                                      });
                                }
                              }
                            });
                          },
                          icon: const Icon(Icons.save)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              print(widget.isParty);
                              widget.isParty = !widget.isParty;
                              //it need push and replacement only for now pop,
                              Navigator.of(context).pop();
                            });
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Billbooltab(
                  //scrollController: widget.scrollController,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    //controller: widget.scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text("Party name"),
                                TextFieldWidget(
                                  isMandatory: true,
                                minLength: 1,
                                maxLength: 3,                                        
                                  texteditingcontroller: txtName,
                                  hintText: "enter name",
                                  name:"party name",
                                  width:
                                      MediaQuery.of(context).size.width * .2,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Leagal name"),
                                TextFieldWidget(
                                    isMandatory: true,
                                minLength: 1,
                                maxLength: 3, 
                                    texteditingcontroller:
                                        leagalnamecontroller,
                                    hintText: "Type",
                                    width: MediaQuery.of(context).size.width *
                                        .2),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: 20,
                          height: 50,
                          child: Row(
                            children: [
                              const Text("Type"),
                              Flexible(
                                  child: IIMultiCheckforBillbookParty(
                                      controller: multicheckboxcontroller,
                                      width: 180,
                                      height: 50,
                                      direction: Axis.horizontal)),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height: 800,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: const Text("Contact Details",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    TextWidgetWithHead(
                                       texteditingcontroller:
                                            contactpersonnamecontroller,
                                        txtHead: 'Contact Person',
                                        hintText: "Contact person Name"),
                                    const SizedBox(height: 20),
                                    TextFieldWidget(
                                        validatefunction:
                                            validateFields.validateTextFields,
                                        hintText: "Designation",
            
                                        texteditingcontroller:
                                            designationcontroller),
                                    const SizedBox(height: 20),
                                    TextFieldWidget(
                                     labelString: "email",
                                        hintText: "Email",
                                        texteditingcontroller:
                                            textemailcontroller),
                                    const SizedBox(height: 20),
                                    Numerictextfield(
                                        validatefunction:
                                            validateFields.validatephone,
                                        numericcontroller:
                                            workmobilecontroller,
                                        hinttext: "office Number"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Iidropdownharcodedforparty(controller: searchtextRoutecontroller,
                                      labelstringList: const ["a", "b"],
                                      textEditingController: routecontroller,
                                      hinttext: "route",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
            
                      ///registration
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: const Text("Registration Details",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Iidropdownharcodedforparty(controller: valueregistercontroller,
                                      dropdownheading: "Registration Type",
                                      labelstringList: const [
                                        "registered",
                                        "unregistered"
                                      ],
                                      textEditingController: typecontroller,
                                      hinttext: "register type",
                                    ),
                                    TextWidgetWithHead(
                                        validatefunction:
                                            validateFields.validateGst,
                                        texteditingcontroller: gstcontroller,
                                        txtHead: 'GST',
                                        hintText: "GST Number"),
                                    const SizedBox(height: 20),
                                    TextFieldWidget(
                                        validatefunction:
                                            validateFields.validatePancard,
                                        hintText: "PAN",
                                        texteditingcontroller: pancontroller),
                                    const SizedBox(height: 20),
                                    Iidropdownharcodedforparty(controller: searchtextStatecontroller,
                                        dropdownheading: "State",
                                        labelstringList: const [],
                                        textEditingController:
                                            statecontroller),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Credit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Numerictextfield(
                                                validatefunction:
                                                    validateFields
                                                        .validateTextFields,
                                                numericcontroller:
                                                    creditlimit,
                                                hinttext: " credit limit ",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Numerictextfield(
                                                validatefunction:
                                                    validateFields
                                                        .validateTextFields,
                                                numericcontroller: noofcreditcontroller,
                                                hinttext:
                                                    " number of credit ",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Numerictextfield(
                                                numericcontroller:
                                                    creditNoOfdays,
                                                hinttext: "credit days",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                            ],
                                          ),
                                          IICheckBox(controller: disablebillingcontroller,caption: "disable billing",),
                                          SizedBox(height: 10,),
                                          TextFieldWidget(
                                        
                                        hintText: "message",
                                        texteditingcontroller:billingsiablemessagecontroller
                                            ),
            
            
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
            
                      const SizedBox(
                        height: 40,
                      ),
            
                      ///address
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: const Text("Address",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: Row(
                                        children: [
                                          IITextEditingControllerforparyt(
                                            validatefunction: validateFields
                                                .validateTextFields,
                                            textlabel: "billing address",
                                            HintText: "billing address",
                                            widthOfTextField:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5,
                                            textEditingController:
                                                billingaddresscontroller,
                                            controller:
                                                valuecontrollerFortextbox,
                                          ),
                                           SizedBox(
                                            width: 50,
                                          ),
                                          Column(
                                            children: [
                                              TextFieldWidget(
                                                texteditingcontroller:
                                                    billinglocation,
                                                hintText: "billing location",
                                                height: 3,
                                                
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Numerictextfield(
                                                numericcontroller: billingpin,
                                                hinttext: "billing pin",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                child:
                                                    Iidropdownharcodedforparty(controller: searchbillingstatecontroller,
                                                  WidthOfDropdown:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2,
                                                  labelstringList: const [
                                                    "kerala",
                                                    "tn"
                                                  ],
                                                  textEditingController:
                                                      billingstatecontroller,
                                                  hinttext: "biling state",
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width,
                                      height: 200,
                                      child: Row(
                                        children: [
                                          IITextEditingControllerforparyt(
                                            validatefunction: validateFields
                                                .validateTextFields,
                                            textlabel: "shipping address",
                                            widthOfTextField:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .5,
                                            textEditingController:
                                                shippingaddresscontroller,
                                            controller:
                                                valuecontrollerFortextbox,
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Column(
                                            children: [
                                              TextFieldWidget(
                                                texteditingcontroller:
                                                    shippinglocation,
                                                hintText: "shipping location",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Numerictextfield(
                                                numericcontroller:
                                                    shippingpin,
                                                hinttext: "shipping pin",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Iidropdownharcodedforparty(controller: searchshippingststecontroller,
                                                WidthOfDropdown:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2,
                                                labelstringList: const [
                                                  "kerala",
                                                  "tn"
                                                ],
                                                textEditingController:
                                                    shippingstatecontroller,
                                                hinttext: "shipping state",
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
            
                      ///bank details
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context)
                                  .size
                                  .height, // Use height of screen
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: const Text("Bank Details",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetWithHead(
                                              validatefunction: validateFields
                                                  .validateTextFields,
                                              texteditingcontroller:
                                                  accountnamecontroller,
                                              txtHead: 'Account name',
                                              hintText: "A/C name"),
                                          const SizedBox(height: 20),
                                          Numerictextfield(
                                            numericcontroller:
                                                accountnumbercontroller,
                                            hinttext: "A/C number",
                                          ),
                                          const SizedBox(height: 20),
                                          TextFieldWidget(
                                              validatefunction: validateFields
                                                  .validateTextFields,
                                              hintText: "Bank name",
                                              texteditingcontroller:
                                                  banknamecontroller),
                                          const SizedBox(height: 20),
                                          TextFieldWidget(
                                              texteditingcontroller:
                                                  branchnamecontroller,
                                              hintText: "Branch name"),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFieldWidget(
                                              validatefunction: (ifsc) =>
                                                  ifsc!.isEmpty
                                                      ? "please enter ifsc"
                                                      : null,
                                              texteditingcontroller:
                                                  ifsccontroller,
                                              hintText: "IFSC"),
                                        ],
                                      ),
                                    ),
                                  ]))),
                      const SizedBox(
                        height: 30,
                      ),
            
                      ///opening
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context)
                                  .size
                                  .height, // Use height of screen
                              child: Column(
                               
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
            
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "opening",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                                                    Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IIGrid( getStateVariable: (PlutoGridAdapter a){
            
                                        tblOpening=a;
                                        
                                        //tblOpening!.addColumn("sl no", "sl no", PlutoColumnType.number());
                                        tblOpening!.addColumn("bill date", "bill date", PlutoColumnType.date());
                                        tblOpening!.addColumn("bill no", "bill no", PlutoColumnType.text(defaultValue: ""));
                                        tblOpening!.addColumn("credit days", "credit days", PlutoColumnType.text(defaultValue: ""));
                                        tblOpening!.addColumn("receivable amt", "receivable amt", PlutoColumnType.text(defaultValue: ""));
                                        tblOpening!.addColumn("payable amount", "payable amount", PlutoColumnType.text(defaultValue: ""));
            
                                      },)
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future validatingFields(
    String emailcontroller,
    String namecontroller,
    String designationcontroller,
    String workmobilecontroller,
    String whatsappnumber,
    String gstcontroller,
    String pancontroller,
    String statecontroller,
    String typecontroller,
    String billingaddresscontroller,
    String shippingaddresscontroller,
    String billinglocation,
    String shippinglocation,
    String billingpin,
    String shippingpin,
    String billingstatecontroller,
    String shippingstatecontroller,
    String accountnamecontroller,
    String accountnumbercontroller,
    String banknamecontroller,
    String branchnamecontroller,
    String ifsccontroller,
    String creditNoOfdays,
    String routecontroller,
    String creditNo,
    String partynamecontroller,
    String partytypecontroller,
  ) async {
    if (emailcontroller.isEmpty ||
        namecontroller.isEmpty ||
        designationcontroller.isEmpty ||
        workmobilecontroller.isEmpty ||
        whatsappnumber.isEmpty ||
        gstcontroller.isEmpty ||
        pancontroller.isEmpty ||
        statecontroller.isEmpty ||
        typecontroller.isEmpty ||
        billingaddresscontroller.isEmpty ||
        shippingaddresscontroller.isEmpty ||
        billinglocation.isEmpty ||
        shippinglocation.isEmpty ||
        billingpin.isEmpty ||
        shippingpin.isEmpty ||
        billingstatecontroller.isEmpty ||
        shippingstatecontroller.isEmpty ||
        accountnamecontroller.isEmpty ||
        accountnumbercontroller.isEmpty ||
        banknamecontroller.isEmpty ||
        branchnamecontroller.isEmpty ||
        ifsccontroller.isEmpty ||
        creditNoOfdays.isEmpty ||
        routecontroller.isEmpty ||
        creditNo.isEmpty ||
        partynamecontroller.isEmpty ||
        partytypecontroller.isEmpty) {
      await showDialog(
          context: context,
          builder: (context) {
            return IIOkMessage(label: "empty field found");
          });
    }

    if (branchnamecontroller.length < 15) {
      "enter valid ";
    }
  }


}
