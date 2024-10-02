
//In addition iigrid class use an extention AutomaticKeepAliveClientMixin for keep te grid alive during scroll




import 'package:billbook/iibase/custom%20widgets/IIButton.dart';
import 'package:billbook/party/buisness%20logic/gridprovider.dart';
import 'package:flutter/Material.dart';
import 'package:pdf/pdf.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';


class PlutoGridAdapter {


List<PlutoRow> rows=List.empty(growable: true);
 PlutoGridStateManager  ?stateManager;


  void addColumn(String t,String f,PlutoColumnType dt){
    final newColumn =
    PlutoColumn(title:t, field: f, type: dt);
    stateManager!.insertColumns(
        stateManager!.columns.length, [newColumn]); // Inserts at the bbottom

}
void RemoveAllRow()
{
  stateManager!.removeAllRows();
}

void updateGrid(){
  print("adding row");
  print(rows.length);

  stateManager!.appendRows(rows);
  stateManager!.notifyListeners();
}

// void addRow() {
//   // Create a new row with empty values
//   final newRow = PlutoRow(
//     cells: {
//       "sl no": PlutoCell(value: ""),
//       "bill date": PlutoCell(value: ""),
//       "bill no": PlutoCell(value: ""),
//       "credit days": PlutoCell(value: ""),
//       "receivable amt": PlutoCell(value: ""),
//       "payable amount": PlutoCell(value: ""),
//     },
//   );
//   // Make sure the stateManager is not null before appending
//   if (stateManager != null) {
//     stateManager!.appendRows([newRow]);
//     stateManager!.notifyListeners();
//   } else {
//     print("State Manager is not initialized!");
//   }
// }

  bool setData(int rowIndex,String n,dynamic v)
 {
if (rowIndex < 0 || rowIndex > rows.length) {      
      return false;
    }
      if(rowIndex==rows.length){
        final newRow = PlutoRow(
        cells: {
          n: PlutoCell(value: v),          
        },
        );
  print(newRow.toJson(includeChildren: true));
      rows.add(newRow);       
      return true;
    }
  rows[rowIndex].cells.addAll({n: PlutoCell(value: v)});
  return true;
 }
 bool setDataold(int rowIndex,String columnName,dynamic value)
 {

if (rowIndex < 0 || rowIndex > stateManager!.rows.length) {      
      return false;
    }

    
      
      print("start $rowIndex $columnName $value  ${stateManager!.rows.length}");
      if(rowIndex==stateManager!.rows.length){
        final newRow = PlutoRow(
        cells: {
          columnName: PlutoCell(value: value),
        },
        );

    try{
      if (stateManager != null) {
        
       stateManager!.appendRows([newRow]);
        stateManager!.notifyListeners();
      }
      }
       catch(e)
      {
        print("erro : $e");
        print(e.runtimeType.toString());
    }
       
      return true;
    }
  
  
   

  




stateManager!.rows[rowIndex].cells.addAll({columnName: PlutoCell(value: value)});
return true;


 }

dynamic getData(int rowIndex,String columnName)
 {
   if (rowIndex < 0 || rowIndex >= stateManager!.rows.length) {      
         return "";
       }

  PlutoRow? r=stateManager!.rows.elementAtOrNull(rowIndex);
   if( r==null)
   {
     return "";
   }

   if(r.cells.containsKey(columnName))
   {
      return stateManager!.rows[rowIndex].cells[columnName]!.value ;  
   }

   return "";
 }

int RowCount(){
  try{
    return stateManager!.rows.length;
  }catch(e){
    return 0;
  }

}
PlutoRow? Row(int rowIndex,String columnName)
 {
   if (rowIndex < 0 || rowIndex >= stateManager!.rows.length) {      
         return null;
       }

  PlutoRow? r=stateManager!.rows.elementAtOrNull(rowIndex);
   if( r==null)
   {
     return null;
   }

   return r;
 }
}

class IIGrid extends StatefulWidget  {
void Function(PlutoGridAdapter) getStateVariable;
 late PlutoGridAdapter adapter;
IIGrid({required this.getStateVariable});
  @override
  State<IIGrid> createState() => _IIGridState();
}
class _IIGridState extends State<IIGrid> with AutomaticKeepAliveClientMixin {  
   @override
  bool get wantKeepAlive => true;

  
  late PlutoGridStateManager stateManager;
     final newRow = PlutoRow(
      cells: {
        "sl no":PlutoCell(value: ""),
        "bill date":PlutoCell(value: ""),
        "bill no":PlutoCell(value: ""),
          "credit days":PlutoCell(value: ""),
        "receivable amt":PlutoCell(value: ""),
          "payable amount":PlutoCell(value: "")
            },
    );


late PlutoGridAdapter a;
bool isFilterPlutoGridColumn=false;
PlutoGridAdapter _grid=PlutoGridAdapter();
late PlutoGridStateManager stateManager1;
void initState() {
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    super.
    build(context); 
    return Column(
        children: [
          Row(
            children: [                           IIButton(onpress:(){setState(() {
                              addNewRow();
                              
                              print("button pressede for newline");
                    
                   // print("FETCHED DATA : ${fetchAllData()}");
                            });}, Child: Text("Add Row")),
                             IIButton(onpress:(){removeRow();}, Child: Text("a")),
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              padding: const EdgeInsets.all(0),
              child: PlutoGrid(
                columns: [],
                rows: [],
                //columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  stateManager = event.stateManager;
                  widget.adapter=PlutoGridAdapter();
                  widget.adapter.stateManager=event.stateManager;
                  widget.getStateVariable(widget.adapter);
                  widget.adapter.stateManager!.setShowColumnFilter(true);
            
                 print("state $isFilterPlutoGridColumn");
                  //SELECT MULTIPLE ROWS BY PRESSING SHIFT+ARROW KEY
                  event.stateManager
                      .setSelectingMode(PlutoGridSelectingMode.row);
                },
               
                 onChanged: (PlutoGridOnChangedEvent event) {
    print('Changed cell: ${event.column.field}, new value: ${event.value}');
  if (stateManager.currentRowIdx ==
              stateManager.rows.length - 1)
              {
           addNewRow();
              }

    // Perform your custom logic here
  },
                configuration: const PlutoGridConfiguration(
                  enableMoveHorizontalInEditing: true,
                ),
              ),
            ),
          ),
        ],
      );
    
  }
 
  void removeRow() {
    //stateManager.removeCurrentRow();
  }
  void addNewColumn() {
    final getnewColumn =
    PlutoColumn(title: "", field: "", type: PlutoColumnType.text());
    // Insert the new row at the bottom
    //stateManager.insertColumns(
       // stateManager!.columns.length, [newColumn]); // Inserts at the bbottom
  }
  //export  to pdf
  Future<void> generateAndExportPDF() async {
    final pdf = pw.Document();
    // // Add a page
    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) {
    //       return pw.Column(
    //         children: [
    //           pw.Text("PlutoGrid Table Data",
    //               style: const pw.TextStyle(fontSize: 24)),
    //           pw.Table.fromTextArray(
    //             headers: widget.columns.map((column) => column.title).toList(),
    //             data: rows.map((row) {
    //               return row.cells.values
    //                   .map((cell) => cell.value.toString())
    //                   .toList();
    //             }).toList(),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
// List<Map<String, dynamic>> saveAllRows(Buildcontext) {
  // final List<PlutoRow> rows = [
  //   PlutoRow(
  //     cells: {
  //       'sl no': PlutoCell(value: ""),
  //       'Bill date': PlutoCell( value:""),
  //       'Bill no': PlutoCell(value: ""),
  //       'Credit days': PlutoCell(value: ''),
  //       'Receivable amount': PlutoCell(value: ''),
  //       'Payable amount': PlutoCell(value: ""),
  //     },
  //   ),
  // ];
    final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(
      title: 'sl no',
      fields: ['sl no'],
      expandedColumn: true,
    ),
    PlutoColumnGroup(title: 'Bill', fields: ['Bill date', 'Bill no']),  
  ];

int lastSlNo = 0;
  void addNewRow() {
    
    lastSlNo++;
    final newRow = PlutoRow(
      cells: {
       "sl no": PlutoCell(value: ""),
        'bill date': PlutoCell(value: ''),
        'bill no': PlutoCell(value: ""),
        'credit days': PlutoCell(value: ''),
        'receivable amt': PlutoCell(value: ''),
        'payable amount': PlutoCell(value: ""),
      
      },
    );
    // Insert the new row at the top
    stateManager
        .insertRows(stateManager.rows.length, [newRow]); // Inserts at the top
  }







}



