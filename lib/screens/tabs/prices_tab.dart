import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PricesTab extends StatelessWidget {
  var categs = ['Vegetables and Fruits', 'Fish', 'Poultry', 'Meat', 'Crops'];

  var from = '';
  var to = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: (() {})),
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
                              Expanded(
                                child: SizedBox(
                                  child: ListView.separated(
                                      itemCount: 10,
                                      separatorBuilder: ((context, index) {
                                        return Divider();
                                      }),
                                      itemBuilder: ((context, index) {
                                        return ListTile(
                                          title: NormalText(
                                              label: 'Item Name',
                                              fontSize: 14,
                                              color: Colors.black),
                                          trailing: NormalText(
                                              label: '₱200.00 - ₱500.00',
                                              fontSize: 12,
                                              color: primary),
                                        );
                                      })),
                                ),
                              )
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
