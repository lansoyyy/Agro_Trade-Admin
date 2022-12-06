import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/drop_down_button.dart';

class AccountsTab extends StatefulWidget {
  const AccountsTab({super.key});

  @override
  State<AccountsTab> createState() => _AccountsTabState();
}

class _AccountsTabState extends State<AccountsTab> {
  @override
  void initState() {
    super.initState();
    getTotalUsers();
    getTotalVerifiedUsers();
    getTotalUnverifiedUsers();
  }

  int value1 = 0;

  late String filter = 'All Users';

  late int totalUsers = 0;

  getTotalUsers() async {
    // Use provider
    var collection = FirebaseFirestore.instance.collection('users');

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          totalUsers = querySnapshot.size;
        }
      });
    }
  }

  late int totalVerifiedUsers = 0;

  getTotalVerifiedUsers() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: 'Verified');

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          totalVerifiedUsers = querySnapshot.size;
        }
      });
    }
  }

  late int totalUnverifiedUsers = 0;

  getTotalUnverifiedUsers() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: 'Not Verified');

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          totalUnverifiedUsers = querySnapshot.size;
        }
      });
    }
  }

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
                            BoldText(
                                label: totalUsers.toString(),
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
                            BoldText(
                                label: totalVerifiedUsers.toString(),
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
                          'assets/images/not.png',
                          width: 50,
                          height: 50,
                          color: primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText(
                                label: 'Unverified Users',
                                fontSize: 18,
                                color: primary),
                            const SizedBox(height: 15),
                            BoldText(
                                label: totalUnverifiedUsers.toString(),
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
                              filter = 'All Users';
                            });
                          },
                          value: 0,
                          child: DropDownItem(label: '    All users'),
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Verified';
                            });
                          },
                          value: 1,
                          child: DropDownItem(label: '    Verified users'),
                        ),
                        DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              filter = 'Unverified';
                            });
                          },
                          value: 2,
                          child: DropDownItem(label: '    Unverified users'),
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
                      DataColumn(
                          label: NormalText(
                              label: '', fontSize: 12, color: Colors.black)),
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
                          DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
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
