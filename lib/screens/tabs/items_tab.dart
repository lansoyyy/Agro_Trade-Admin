import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../widgets/drop_down_button.dart';

class ItemsTab extends StatefulWidget {
  const ItemsTab({super.key});

  @override
  State<ItemsTab> createState() => _AccountsTabState();
}

class _AccountsTabState extends State<ItemsTab> {
  int value1 = 0;

  late String filter = 'All Users';

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM, EEEE, yyyy").format(DateTime.now());

    Map<String, double> dataMap = {
      "Vegetables and Fruits": 1,
      "Poultry": 1,
      "Meat": 1,
      "Fish": 1,
    };

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            NormalText(label: date, fontSize: 24, color: primary),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/products.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Total Items Posted',
                                fontSize: 18,
                                color: primary),
                            const SizedBox(height: 15),
                            BoldText(label: '1', fontSize: 42, color: primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: const [
                        Colors.green,
                        Colors.red,
                        Colors.brown,
                        Colors.blue,
                      ],
                      initialAngleInDegree: 0,
                      chartType: ChartType.disc,
                      ringStrokeWidth: 32,
                      centerText: "Items",
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.right,
                        showLegendsInRow: false,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                      // gradientList: ---To add gradient colors---
                      // emptyColorGradient: ---Empty Color gradient---
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 300, left: 300, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      underline: Container(color: Colors.transparent),
                      iconEnabledColor: Colors.black,
                      isExpanded: true,
                      value: value1,
                      items: [
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Vegetables and Fruits';
                            });
                          },
                          value: 0,
                          child:
                              DropDownItem(label: '    Vegetables and Fruits'),
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Fish';
                            });
                          },
                          value: 1,
                          child: DropDownItem(label: '    Fish'),
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Poultry';
                            });
                          },
                          value: 2,
                          child: DropDownItem(label: '    Poultry'),
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Meat';
                            });
                          },
                          value: 3,
                          child: DropDownItem(label: '    Meat'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          value1 = int.parse(value.toString());
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(color: primary, width: 2),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: DataTable(
                    // datatable widget
                    columns: [
                      // column to set the name
                      DataColumn(
                          label: NormalText(
                              label: 'No.', fontSize: 12, color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: '          Item Image',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Item Name',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Item Category',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Seller Name',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Seller Address',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Seller Contact Number',
                              fontSize: 12,
                              color: Colors.black)),
                    ],

                    rows: [
                      // row to set the values
                      for (int i = 0; i < 20; i++)
                        DataRow(cells: [
                          DataCell(
                            NormalText(
                                label: i.toString(),
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          const DataCell(
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: CircleAvatar(
                                minRadius: 50,
                                maxRadius: 50,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          DataCell(
                            NormalText(
                                label: 'Item Name',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'Poultry',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'John Doe',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'Cagayan De Oro City',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: '09090104355',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
