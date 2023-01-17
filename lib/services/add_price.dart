import 'package:cloud_firestore/cloud_firestore.dart';

Future addPrce(String name, String categ, String price) async {
  final docUser = FirebaseFirestore.instance.collection('Prices').doc();

  final json = {
    "name": name,
    "price": price,
    "categ": categ,
    'id': docUser.id,
  };

  await docUser.set(json);
}
