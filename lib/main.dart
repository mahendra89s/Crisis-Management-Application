
import 'package:flutter/material.dart';
import 'package:calmity/models/user.dart';
import 'package:calmity/screens/index/index.dart';
import 'package:calmity/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:calmity/services/auth.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: [
        Locale('en', 'UK'),
        Locale('hi', 'IN'),
        Locale('ka', 'IN')
      ],
      fallbackLocale: Locale('en', 'UK'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Futura'),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Index(),
      ),
    );
  }
}
