import 'package:calmity/screens/pages/donation_layout/Donation.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:news_app_api/secret.dart';

class DonationList {
  List<Donation> donationlist = [];

  Future<void> getDonation() async {
    QuerySnapshot snap =
        await Firestore.instance.collection('donation').getDocuments();

    snap.documents.forEach((element) {
      Donation donation = Donation(
        title: element['title'],
        url: element["url"],
      );
      donationlist.add(donation);
    });
  }
}
