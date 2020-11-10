import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calmity/screens/pages/govScheme_layout/gov_page.dart';
import 'package:calmity/screens/pages/govScheme_layout/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class Governmentschemes extends StatefulWidget with NavigationStates {
  @override
  _GovernmentschemesState createState() => _GovernmentschemesState();
}

class _GovernmentschemesState extends State<Governmentschemes> {
  final FirebaseAuth _auth1 = FirebaseAuth.instance;
  FirebaseUser user;
  var schemelist;
  bool _loading;
  void getScheme() async {
    GovScheme scheme = GovScheme();
    await scheme.getNews();
    schemelist = scheme.schemelist;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getScheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text(
                        'government_scheme'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 28.0),
                      ),
                      SizedBox(height: 30),

                      // Gov Scheme
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: schemelist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SchemeTile(
                                title: schemelist[index].title ?? "",
                                desc: schemelist[index].desc ?? "",
                                url: schemelist[index].url ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
