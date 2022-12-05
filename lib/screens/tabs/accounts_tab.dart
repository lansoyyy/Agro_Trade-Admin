import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountsTab extends StatelessWidget {
  const AccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM, EEEE, yyyy").format(DateTime.now());

    Map<String, double> dataMap = {
      "Fish": 5,
      "Meat": 5,
      "Vegetables and Fruits": 5,
      "Poultry": 5,
    };

    return SingleChildScrollView(
      child: Container(
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
                          'assets/images/total.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Total Users',
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
                          'assets/images/verified.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Verified Users',
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
                          'assets/images/not.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Total Users',
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
                              label: '          Profile',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Name',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Address',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Contact Number',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Email',
                              fontSize: 12,
                              color: Colors.black)),
                      DataColumn(
                          label: NormalText(
                              label: 'Status',
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
                                label: 'John Doe',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'Lorem Ipsum',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: '09090104355',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'doe@gmail.com',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          DataCell(
                            NormalText(
                                label: 'Unverified',
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
