import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/services/add_price.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PricesTab extends StatefulWidget {
  @override
  State<PricesTab> createState() => _PricesTabState();
}

class _PricesTabState extends State<PricesTab> {
  var categs = ['Vegetables and Fruits', 'Fish', 'Poultry', 'Meat', 'Crops'];

  var from = '';

  var to = '';

  var itemName = '';

  var priceRange = '';

  var dropDownValue = 1;

  var productCategory = 'Vegetables & Fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: (() {
            showDialog(
                context: context,
                builder: ((context) {
                  return StatefulBuilder(builder: ((context, setState) {
                    return Dialog(
                      child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            BoldText(
                                label: 'Adding Prices',
                                fontSize: 16,
                                color: Colors.black),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Product Name'),
                                onChanged: ((value) {
                                  itemName = value;
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText:
                                        'Price Range (ex. ₱200.00 - ₱500.00)'),
                                onChanged: ((value) {
                                  priceRange = value;
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            NormalText(
                                label: 'Category',
                                fontSize: 8,
                                color: Colors.grey),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 2, 20, 2),
                                    child: DropdownButton(
                                      underline:
                                          Container(color: Colors.transparent),
                                      iconEnabledColor: Colors.black,
                                      isExpanded: true,
                                      value: dropDownValue,
                                      items: [
                                        for (int i = 0; i < categs.length; i++)
                                          DropdownMenuItem(
                                            onTap: () {
                                              productCategory = categs[i];
                                            },
                                            child: Center(
                                                child: Row(children: [
                                              Text(categs[i],
                                                  style: TextStyle(
                                                    fontFamily: 'QRegular',
                                                    color: Colors.black,
                                                  ))
                                            ])),
                                            value: i,
                                          ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          dropDownValue =
                                              int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                                minWidth: 200,
                                height: 40,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: NormalText(
                                    label: 'Continue',
                                    fontSize: 12,
                                    color: Colors.white),
                                onPressed: (() {
                                  addPrce(
                                      itemName, productCategory, priceRange);
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: NormalText(
                                              label: 'Price added succesfully!',
                                              fontSize: 12,
                                              color: Colors.white)));
                                }))
                          ],
                        ),
                        width: 300,
                        height: 350,
                      ),
                    );
                  }));
                }));
          })),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: BoldText(label: 'Price Range', fontSize: 32, color: primary),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                  itemCount: categs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              BoldText(
                                  label: categs[index],
                                  fontSize: 18,
                                  color: primary),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Prices')
                                      .where('categ', isEqualTo: categs[index])
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return const Center(child: Text('Error'));
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
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
                                    return Expanded(
                                      child: SizedBox(
                                        child: ListView.separated(
                                            itemCount: data.docs.length,
                                            separatorBuilder:
                                                ((context, index) {
                                              return Divider();
                                            }),
                                            itemBuilder: ((context, index1) {
                                              return ListTile(
                                                title: NormalText(
                                                    label: data.docs[index1]
                                                        ['name'],
                                                    fontSize: 14,
                                                    color: Colors.black),
                                                trailing: NormalText(
                                                    label:
                                                        '₱${data.docs[index1]['price']}',
                                                    fontSize: 12,
                                                    color: primary),
                                              );
                                            })),
                                      ),
                                    );
                                  })
                            ],
                          ),
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}
