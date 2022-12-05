import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM, EEEE, yyyy").format(DateTime.now());

    Map<String, double> dataMap = {
      "Fish": 5,
      "Meat": 5,
      "Vegetables and Fruits": 5,
      "Poultry": 5,
    };

    return Container(
      padding: const EdgeInsets.only(left: 20),
      color: Colors.white,
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
                padding: const EdgeInsets.only(left: 20, top: 10),
                height: 120,
                width: 250,
                color: greyAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                        label: 'TOTAL TRADES',
                        fontSize: 12,
                        color: Colors.grey),
                    const SizedBox(
                      height: 20,
                    ),
                    BoldText(label: ' 1', fontSize: 48, color: primary),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                height: 100,
                width: 250,
                color: greyAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                        label: 'UNREAD MESSAGES',
                        fontSize: 12,
                        color: Colors.grey),
                    const SizedBox(
                      height: 20,
                    ),
                    BoldText(label: ' 1', fontSize: 32, color: primary),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                height: 100,
                width: 250,
                color: greyAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                        label: 'READ MESSAGES',
                        fontSize: 12,
                        color: Colors.grey),
                    const SizedBox(
                      height: 20,
                    ),
                    BoldText(label: ' 1', fontSize: 32, color: primary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 5.2,
              colorList: const [
                Colors.blue,
                Colors.red,
                Colors.green,
                Colors.amber
              ],
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              centerText: "Products",
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
        ],
      ),
    );
  }
}
