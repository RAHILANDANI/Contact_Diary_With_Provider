import 'package:advance_tutorial_1_contact_diary/provider/add_contact_provider.dart';
import 'package:advance_tutorial_1_contact_diary/provider/theme_provider.dart';
import 'package:advance_tutorial_1_contact_diary/views/get_start.dart';
import 'package:advance_tutorial_1_contact_diary/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? start = pref.getBool('isStart');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => addcontacatprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => themeProvider(),
      )
    ],
    builder: (context, _) => MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          (Provider.of<themeProvider>(context).themeDetails.isDark == false)
              ? ThemeMode.dark
              : ThemeMode.light,
      initialRoute: (start == true) ? 'homepage' : 'getstart',
      routes: {
        'homepage': (context) => homepage(),
        'add': (context) => Add(),
        'getstart': (context) => getstart(),
      },
    ),
  ));
}
//
