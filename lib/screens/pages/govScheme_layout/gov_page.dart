import 'package:calmity/screens/pages/govScheme_layout/Scheme.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:news_app_api/secret.dart';

class GovScheme {
  List<Scheme> schemelist = [];

  Future<void> getNews() async {
    QuerySnapshot snap =
        await Firestore.instance.collection('govScheme').getDocuments();

    snap.documents.forEach((element) {
      Scheme scheme = Scheme(
        title: element['title'],
        desc: element['desc'],
        url: element["url"],
      );
      schemelist.add(scheme);
    });
  }
}
