import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as fchart;

class TradeTab extends StatefulWidget {
  const TradeTab({super.key});

  @override
  State<TradeTab> createState() => _AccountsTabState();
}

class _AccountsTabState extends State<TradeTab> {
  @override
  void initState() {
    super.initState();
    getPending();
    getAccepted();
    getRejected();
    getMonth1();
    getMonth2();
    getMonth3();
    getMonth4();
    getMonth5();
    getMonth6();
    getMonth7();
    getMonth8();
    getMonth9();
    getMonth10();
    getMonth11();
    getMonth12();
  }

  int value1 = 0;

  late String filter = 'All Users';

  late int pending = 0;

  getPending() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('offer')
        .where('status', isEqualTo: "Pending");

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          pending = querySnapshot.size;
        }
      });
    }
  }

  late int accepted = 0;

  getAccepted() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('offer')
        .where('status', isEqualTo: "Accepted");

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          accepted = querySnapshot.size;
        }
      });
    }
  }

  late int rejected = 0;

  getRejected() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('offer')
        .where('status', isEqualTo: "Rejected");

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          rejected = querySnapshot.size;
        }
      });
    }
  }

  late int month1 = 0;

  getMonth1() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 1);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month1 = querySnapshot.size;
        }
      });
    }
  }

  late int month2 = 0;

  getMonth2() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 2);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month2 = querySnapshot.size;
        }
      });
    }
  }

  late int month3 = 0;

  getMonth3() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 3);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month3 = querySnapshot.size;
        }
      });
    }
  }

  late int month4 = 0;

  getMonth4() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 4);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month4 = querySnapshot.size;
        }
      });
    }
  }

  late int month5 = 0;

  getMonth5() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 5);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month5 = querySnapshot.size;
        }
      });
    }
  }

  late int month6 = 0;

  getMonth6() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 6);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month6 = querySnapshot.size;
        }
      });
    }
  }

  late int month7 = 0;

  getMonth7() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 7);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month7 = querySnapshot.size;
        }
      });
    }
  }

  late int month8 = 0;

  getMonth8() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 8);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month8 = querySnapshot.size;
        }
      });
    }
  }

  late int month9 = 0;

  getMonth9() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 9);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month1 = querySnapshot.size;
        }
      });
    }
  }

  late int month10 = 0;

  getMonth10() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 10);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month10 = querySnapshot.size;
        }
      });
    }
  }

  late int month11 = 0;

  getMonth11() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 11);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month11 = querySnapshot.size;
        }
      });
    }
  }

  late int month12 = 0;

  getMonth12() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('products')
        .where('date', isEqualTo: 12);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          month12 = querySnapshot.size;
        }
      });
    }
  }

  getDates() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('offer')
        .where('status', isEqualTo: "Rejected");

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          rejected = querySnapshot.size;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM, EEEE, yyyy").format(DateTime.now());

    final List<ChartData> chartData = [
      ChartData(01, month1.toDouble()),
      ChartData(02, month2.toDouble()),
      ChartData(03, month3.toDouble()),
      ChartData(04, month4.toDouble()),
      ChartData(05, month5.toDouble()),
      ChartData(06, month6.toDouble()),
      ChartData(07, month7.toDouble()),
      ChartData(08, month8.toDouble()),
      ChartData(09, month9.toDouble()),
      ChartData(10, month10.toDouble()),
      ChartData(11, month11.toDouble()),
      ChartData(12, month12.toDouble()),
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
                            BoldText(
                                label: pending.toString(),
                                fontSize: 42,
                                color: primary),
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
                            BoldText(
                                label: accepted.toString(),
                                fontSize: 42,
                                color: primary),
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
                            BoldText(
                                label: rejected.toString(),
                                fontSize: 42,
                                color: primary),
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
