
import 'package:billbook/party/buisness%20logic/gridprovider.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class PlutoGridtable extends StatefulWidget {
  
   
  // PlutoGridtable({required this.billdatecontroller,required this.creditdayscontroller,required this.billnocontroller,required this.payablecontroller,required this.receivablecontroller});


  @override
  State<PlutoGridtable> createState() => _PlutoGridtableState();
}

class _PlutoGridtableState extends State<PlutoGridtable> {

  bool isFilterPlutoGridColumn = true;
  bool isGstFieldHide = true;
  bool ispartyscreen = false;
  bool isContactdetails = true;
  bool isRegistration=true;
  bool ismore=true;
  TextEditingController texteditingcontroller =TextEditingController();
  TextEditingController numericcontroller = TextEditingController();



  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      enableFilterMenuItem: false,
      backgroundColor: Colors.yellow,
      enableRowDrag: true,
      title: 'sl no',
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

  ///values in each row
  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'sl no': PlutoCell(value: '1'),
        'Bill date': PlutoCell( value:""),
        'Bill no': PlutoCell(value: ""),
        'Credit days': PlutoCell(value: ''),
        'Receivable amount': PlutoCell(value: ''),
        'Payable amount': PlutoCell(value: ""),

      },
    ),
 
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      addNewColumn();
                    });
                  },
                  tooltip: "add column",
                  icon: const Icon(Icons.near_me)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      addNewRow();
                    });
                  },
                  tooltip: "Add row",
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      removeRow();
                    });
                  },
                  tooltip: "remove current row",
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFilterPlutoGridColumn = !isFilterPlutoGridColumn;
                      stateManager.setShowColumnFilter(isFilterPlutoGridColumn);
                    });
                  },
                  tooltip: "filter cell",
                  icon: const Icon(Icons.filter_alt_rounded)),
              IconButton(
                  tooltip: "export to pdf",
                  onPressed: () {
                    setState(() {
                      saveAllRows(BuildContext);
                    });
                  },
                  icon: const Icon(Icons.picture_as_pdf))
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
              padding: const EdgeInsets.all(0),
              child: PlutoGrid(
                columns: columns,
                rows: rows,
               // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  stateManager = event.stateManager;

                  stateManager.setShowColumnFilter(true);
             

                  print("state $isFilterPlutoGridColumn");

                  //SELECT MULTIPLE ROWS BY PRESSING SHIFT+ARROW KEY
                  event.stateManager
                      .setSelectingMode(PlutoGridSelectingMode.row);
                  stateManager = event.stateManager;
                },
                
                
                configuration: const PlutoGridConfiguration(
                  enableMoveHorizontalInEditing: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNewRow() {
    final newRow = PlutoRow(
      cells: {
        'sl no': PlutoCell(value: ''),
        'Bill date': PlutoCell(value: ""),
        'Bill no': PlutoCell(value:"" ),
        'Credit days': PlutoCell(value: ""),
        'Receivable amount': PlutoCell(value: ""),
        'Payable amount': PlutoCell(value:"" ),
      },
    );
    // Insert the new row at the bottom
    stateManager
        .insertRows(stateManager.rows.length, [newRow]); // Inserts at the bottom
  }

  void removeRow() {
    stateManager.removeCurrentRow();
  }

  void addNewColumn() {
    final newColumn =
    PlutoColumn(title: "", field: "", type: PlutoColumnType.text());
    // Insert the new row at the bottom
    stateManager.insertColumns(
        stateManager.columns.length, [newColumn]); // Inserts at the bbottom
  }


  //export  to pdf
  Future<void> generateAndExportPDF() async {
    final pdf = pw.Document();

    // Add a page
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text("PlutoGrid Table Data",
                  style: const pw.TextStyle(fontSize: 24)),
              pw.Table.fromTextArray(
                headers: columns.map((column) => column.title).toList(),
                data: rows.map((row) {
                  return row.cells.values
                      .map((cell) => cell.value.toString())
                      .toList();
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  

List<Map<String, dynamic>> saveAllRows(Buildcontext) {
  final _provider=Provider.of<Gridprovider>(context,listen:  false);
  List<Map<String, dynamic>> allRows = [];
  

  for (PlutoRow row in stateManager.rows) {
    Map<String, dynamic> rowData = {
      'sl no': row.cells['sl no']?.value,
      'Bill date': row.cells['Bill date']?.value,
      'Bill no': row.cells['Bill no']?.value,
      'Credit days': row.cells['Credit days']?.value,
      'Receivable amount': row.cells['Receivable amount']?.value,
      'Payable amount': row.cells['Payable amount']?.value,
    };

    allRows.add(rowData);
    print("all rows : $allRows");
   
  }
  for(int t=0;t<allRows.length;t++)
  {
    print("=======================");
    print(allRows[t]);
    //_provider.lsit(allRows);
  }


  return allRows;
}




}
