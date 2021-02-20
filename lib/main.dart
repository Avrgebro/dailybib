import 'package:dailybib/assets/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:dailybib/view/home.dart';
import 'package:dailybib/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(pinkTheme),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'DailyBib',
      theme: themeNotifier.getTheme(),
      home: HomePage(),
    );
  }
}

