import 'package:flutter/material.dart';
import 'package:calmity/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(EasyLocalization(
    path: 'assets/locales',
    supportedLocales: [
      Locale('en', 'UK'),
      Locale('hi', 'IN'),
      Locale('ka', 'IN')
    ],
    fallbackLocale: Locale('en', 'UK'),
    child: Languages()));

class Languages extends StatefulWidget with NavigationStates {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'languages'.tr(),
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
              ),
              RaisedButton(
                  onPressed: () {
                    context.locale = Locale('en', 'UK');
                  },
                  child: Text("English")),
              RaisedButton(
                  onPressed: () {
                    context.locale = Locale('hi', 'IN');
                  },
                  child: Text("Hindi")),
              RaisedButton(
                  onPressed: () {
                    context.locale = Locale('ka', 'IN');
                  },
                  child: Text("Kannada")),
            ]),
      ),
    );
  }
}
