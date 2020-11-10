import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:calmity/screens/pages/donation_layout/don_page.dart';
import 'package:calmity/screens/pages/donation_layout/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class Donate extends StatefulWidget with NavigationStates {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  var donationlist;
  bool _loading;
  void getDonation() async {
    DonationList donate = DonationList();
    await donate.getDonation();
    donationlist = donate.donationlist;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getDonation();
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
                        'donate'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 28.0),
                      ),
                      SizedBox(height: 30),

                      // Gov Scheme
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: donationlist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DonationTile(
                                title: donationlist[index].title ?? "",
                                url: donationlist[index].url ?? "",
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
