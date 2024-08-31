import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ManagementPage extends StatelessWidget {
  static String route = 'management-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.management,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('addnewemployee-page');
              },
              icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              label: Text(
                AppLocalizations.of(context)!.addNewEmployee,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF16C098),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () async {
                try {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['csv'],
                  );

                  if (result != null) {
                    PlatformFile file = result.files.first;
                    print('Picked file: ${file.name}');
                  }
                } catch (e) {
                  print('Error picking file: $e');
                }
              },
              icon: Icon(Icons.upload_file, color: Colors.grey),
              label: Text(
                '${AppLocalizations.of(context)!.upload}, CSV',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildTable(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 24.0,
            columns: [
              DataColumn(
                label: Text(
                  AppLocalizations.of(context)!.employees,
                ),
              ),
              DataColumn(
                label: Text(
                  AppLocalizations.of(context)!.netSalary,
                ),
              ),
              DataColumn(
                label: Text(
                  AppLocalizations.of(context)!.taxableEarnings,
                ),
              ),
              DataColumn(
                label: Text(
                  '${AppLocalizations.of(context)!.income} ${AppLocalizations.of(context)!.tax}',
                ),
              ),
              DataColumn(
                label: Text(
                  '${AppLocalizations.of(context)!.pension} ${AppLocalizations.of(context)!.tax}',
                ),
              ),
            ],
            rows: List<DataRow>.generate(
              6,
              (index) => DataRow(
                color: MaterialStateProperty.all(
                  index % 2 == 0 ? Colors.blue.shade50 : Colors.white,
                ),
                cells: [
                  DataCell(Text(index.isEven
                      ? 'Abrham Welde'
                      : index.isOdd
                          ? 'Bisrat Alemu'
                          : 'Bisrate Girum')),
                  DataCell(Text(index.isEven ? '15,000' : '25,000')),
                  DataCell(Text(index.isEven ? '2000' : '3000')),
                  DataCell(Text(index.isEven ? '5000' : '7000')),
                  DataCell(Text(index.isEven ? '5000' : '7000')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _generatePDF(BuildContext context) async {
    final employees = AppLocalizations.of(context)!.employees;
    final netSalary = AppLocalizations.of(context)!.netSalary;
    final taxableEarnings = AppLocalizations.of(context)!.taxableEarnings;
    final incomeTax =
        '${AppLocalizations.of(context)!.income} ${AppLocalizations.of(context)!.tax}';
    final pensionTax =
        '${AppLocalizations.of(context)!.pension} ${AppLocalizations.of(context)!.tax}';

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Table.fromTextArray(
            data: <List<String>>[
              <String>[
                employees,
                netSalary,
                taxableEarnings,
                incomeTax,
                pensionTax,
              ],
              ...List.generate(
                  6,
                  (index) => [
                        index.isEven
                            ? 'Abrham Welde'
                            : index.isOdd
                                ? 'Bisrat Alemu'
                                : 'Bisrate Girum',
                        index.isEven ? '15,000' : '25,000',
                        index.isEven ? '2000' : '3000',
                        index.isEven ? '5000' : '7000',
                        index.isEven ? '5000' : '7000',
                      ])
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
