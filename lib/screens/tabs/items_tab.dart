import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as fchart;

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

    final List<ChartData> chartData = [
      ChartData(01, 1),
      ChartData(02, 1),
      ChartData(03, 5),
      ChartData(04, 6),
      ChartData(05, 1),
      ChartData(06, 9),
      ChartData(07, 6),
      ChartData(08, 1),
      ChartData(09, 6),
      ChartData(10, 7),
      ChartData(11, 7),
      ChartData(12, 9),
    ];

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
                          'assets/images/pending.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Pending Trade',
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
                          'assets/images/accepted.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Accepted Trade',
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
                          'assets/images/rejected.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Rejected Trade',
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(label: 'Monthy Trade', fontSize: 32, color: primary),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 300,
                      width: 1000,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 2),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child:
                          fchart.SfCartesianChart(series: <fchart.ChartSeries>[
                        // Renders spline chart
                        fchart.SplineSeries<ChartData, int>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y)
                      ])),
                ],
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
