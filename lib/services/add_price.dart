import 'package:cloud_firestore/cloud_firestore.dart';

Future addPrce(String from, String to, String categ) async {
  final docUser = FirebaseFirestore.instance.collection('Prices').doc();

  final json = {
    "from": from,
    "to": to,
    "categ": categ,
    'id': docUser.id,
  };

  await docUser.set(json);
}
