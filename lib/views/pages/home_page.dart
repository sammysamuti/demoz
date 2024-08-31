import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUpcomingSelected = true;
  final Color backgroundColor = Color(0xFFF5F5F5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.home,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/settings.png'),
            ),
            onPressed: () {
               Get.toNamed('setting-page');
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoCard('Number of Employees', '20', Colors.blue),
                  SizedBox(width: 5),
                  buildInfoCard('Income Tax paid', '2000', Colors.green),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoCard('Pension Tax Paid', '4', Colors.cyan),
                  SizedBox(width: 16),
                  buildInfoCard('Employees Performance', '95 %', Colors.red),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildToggleButton('Upcoming', isUpcomingSelected),
                    buildToggleButton('Past', !isUpcomingSelected),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Aug 28, 2024 - Sep 5, 2024',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFFF7F74),
                                width: 2,
                              ),
                              color: Color(0xFFFF7F74).withOpacity(0.1),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Pay Now',
                                style: TextStyle(
                                  color: Color(0xFFFF7F74),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income Tax',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '4000 ETB',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pension Tax',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '5000 ETB',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'August\nTax on Due',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color(0xFFFF7F74),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildPieChartCard(),
                  SizedBox(width: 16),
                  buildSummaryCard('Tax summery', '9,349.85 etb', '49.98%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
          color: color.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToggleButton(String title, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isUpcomingSelected = title == 'Upcoming';
          });
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue
                : const Color.fromARGB(193, 239, 239, 239),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTaxInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildPieChartCard() {
    return Expanded(
      child: SizedBox(
        height: 220,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Employee Composition',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: SizedBox(
                        height: 100,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Color(0xFF16C098),
                                value: 35,
                                radius: 30,
                                titleStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.transparent,
                                ),
                              ),
                              PieChartSectionData(
                                color: Color(0xFF5932EA),
                                value: 65,
                                radius: 40,
                                titleStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                            centerSpaceRadius: 20,
                            sectionsSpace: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Center(
                      child: Text(
                        '856 employee total',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  top: 70,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.female, size: 14, color: Color(0xFF16C098)),
                        SizedBox(width: 4),
                        Text(
                          '35%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF16C098),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.male, size: 14, color: Color(0xFF5932EA)),
                        SizedBox(width: 4),
                        Text(
                          '65%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF5932EA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSummaryCard(String title, String value, String percentage) {
    return Expanded(
      child: SizedBox(
        height: 220,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' etb',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      percentage,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.green,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
