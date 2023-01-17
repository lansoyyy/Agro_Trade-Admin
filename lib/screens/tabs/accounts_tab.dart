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

  late String filter = 'Verified';

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

  String searchFilter = '';

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
                    top: 10, right: 100, left: 100, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.black, fontFamily: 'Quicksand'),
                          onChanged: (_userName) {
                            setState(() {
                              searchFilter = _userName;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'Search user',
                            hintStyle: const TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                      child: Container(
                        width: 300,
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
                                  filter = 'Verified';
                                });
                              },
                              value: 0,
                              child: DropDownItem(label: '    Verified users'),
                            ),
                            DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  filter = 'Not Verified';
                                });
                              },
                              value: 1,
                              child:
                                  DropDownItem(label: '    Unverified users'),
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
                  ],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: searchFilter == ''
                    ? FirebaseFirestore.instance
                        .collection('users')
                        .where('status', isEqualTo: filter)
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('users')
                        .where('status', isEqualTo: filter)
                        .where('name',
                            isGreaterThanOrEqualTo:
                                toBeginningOfSentenceCase(searchFilter))
                        .where('name',
                            isLessThan:
                                '${toBeginningOfSentenceCase(searchFilter)}z')
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print('waiting');
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;

                  return Center(
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
                                    label: 'ID',
                                    fontSize: 12,
                                    color: Colors.black)),
                            DataColumn(
                                label: NormalText(
                                    label: '          Profile',
                                    fontSize: 12,
                                    color: Colors.black)),
                            DataColumn(
                                label: NormalText(
                                    label: 'First\nname',
                                    fontSize: 12,
                                    color: Colors.black)),
                            DataColumn(
                                label: NormalText(
                                    label: 'Last\nname',
                                    fontSize: 12,
                                    color: Colors.black)),
                            DataColumn(
                                label: NormalText(
                                    label: 'Address',
                                    fontSize: 12,
                                    color: Colors.black)),
                            DataColumn(
                                label: NormalText(
                                    label: 'Contact\nNumber',
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
                                    label: '',
                                    fontSize: 12,
                                    color: Colors.black)),
                          ],

                          rows: [
                            // row to set the values
                            for (int i = 0; i < data.size; i++)
                              DataRow(cells: [
                                DataCell(
                                  IconButton(
                                    onPressed: (() {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return Dialog(
                                              child: SizedBox(
                                                height: 600,
                                                width: 400,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      BoldText(
                                                          label: 'Front ID',
                                                          fontSize: 18,
                                                          color: primary),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  data.docs[i][
                                                                      'idfront']),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                        height: 200,
                                                        width: 200,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      BoldText(
                                                          label: 'Back ID',
                                                          fontSize: 18,
                                                          color: primary),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  data.docs[i][
                                                                      'idback']),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                        height: 200,
                                                        width: 200,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }));
                                    }),
                                    icon: Icon(
                                      Icons.visibility_outlined,
                                      color: primary,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: CircleAvatar(
                                      minRadius: 50,
                                      maxRadius: 50,
                                      backgroundImage:
                                          NetworkImage(data.docs[i]['profile']),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Builder(builder: (context) {
                                    var arr = data.docs[i]['name'].split(' ');
                                    return NormalText(
                                        label: arr[0],
                                        fontSize: 12,
                                        color: Colors.grey);
                                  }),
                                ),
                                DataCell(
                                  Builder(builder: (context) {
                                    var arr = data.docs[i]['name'].split(' ');

                                    return NormalText(
                                        label: arr[1] ?? '',
                                        fontSize: 12,
                                        color: Colors.grey);
                                  }),
                                ),
                                DataCell(
                                  NormalText(
                                      label: data.docs[i]['address'],
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                DataCell(
                                  NormalText(
                                      label: data.docs[i]['contactNumber'],
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                DataCell(
                                  NormalText(
                                      label: data.docs[i]['email'],
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                DataCell(
                                  NormalText(
                                      label: data.docs[i]['status'],
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                DataCell(
                                  data.docs[i]['status'] == 'Not Verified'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(data.docs[i].id)
                                                    .update({
                                                  'status': 'Verified',
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.green,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(data.docs[i].id)
                                                    .update({
                                                  'status': 'Rejected',
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.close_outlined,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                )
                              ]),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
