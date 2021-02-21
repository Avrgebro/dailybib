import 'package:dailybib/assets/themes/themes.dart';
import 'package:dailybib/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSelection extends StatefulWidget {
  @override
  _ThemeSelectionState createState() => _ThemeSelectionState();
}

class _ThemeSelectionState extends State<ThemeSelection> {
  
  String _selected_theme = '';

  /*Future<void> getCurrentTheme() async {
    
    SharedPreferences.getInstance().then((prefs) {
      String theme = prefs.getBool('theme') ?? 'lightTheme';
      setState(() {
        this._selected_theme = theme;
      });
    });
    
  }*/

  // @override
  // void initState() {
  //   this.getCurrentTheme();
  //   super.initState();
  // }

  String getThemeName(ThemeNotifier themeNotifier){
    if(themeNotifier.getTheme() == lightTheme) return 'lightTheme';
    if(themeNotifier.getTheme() == darkTheme) return 'darkTheme';
    if(themeNotifier.getTheme() == pinkTheme) return 'pinkTheme';
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _selected_theme = this.getThemeName(themeNotifier);
    //print(_selected_theme);
    return Scaffold(
          appBar: AppBar(
            title: Text('Temas')
          ),
          body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              //   child: Row(
              //     children: [
              //       Icon(Icons.arrow_back_ios, size: 28,),
              //     ],
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                child: Column(
                        children: <Widget>[
                          RadioListTile<String>(
                            title: const Text('Tema Oscuro'),
                            value: 'darkTheme',
                            groupValue: _selected_theme,
                            onChanged: (String value) {
                              setState(() {
                                this.applySelectedTheme(value, themeNotifier);
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: const Text('Tema Claro'),
                            value: 'lightTheme',
                            groupValue: _selected_theme,
                            onChanged: (String value) {
                              setState(() {
                                this.applySelectedTheme(value, themeNotifier);
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: const Text('Tema Rosado'),
                            value: 'pinkTheme',
                            groupValue: _selected_theme,
                            onChanged: (String value) {
                              setState(() {
                                this.applySelectedTheme(value, themeNotifier);
                              });
                            },
                          ),
                        ],
                      ),
              )
            ],
          ),
        )
        ),
    );
  }

  void applySelectedTheme(String theme, ThemeNotifier themeNotifier) async {

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('theme', theme);
    });

    switch (theme) {
      case 'lightTheme':
        themeNotifier.setTheme(lightTheme);
        break;
      case 'darkTheme':
        themeNotifier.setTheme(darkTheme);
        break;
      case 'pinkTheme':
        themeNotifier.setTheme(pinkTheme);
        break;
      default:
        themeNotifier.setTheme(lightTheme);
    }

  }
}