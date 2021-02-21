import 'package:dailybib/assets/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dailybib/view/home.dart';
import 'package:dailybib/provider/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    String theme = prefs.getString('theme') ?? 'lightTheme';
    ThemeData themedata = lightTheme;
    if(theme == 'lightTheme') themedata = lightTheme;
    if(theme == 'darkTheme') themedata = darkTheme;
    if(theme == 'pinkTheme') themedata = pinkTheme;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(themedata),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'DailyBib',
            theme: themeNotifier.getTheme(),
            home: HomePage(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    ); 
  }
}


