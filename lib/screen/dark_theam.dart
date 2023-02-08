import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';


class DarkTheamScreen extends StatefulWidget {
  const DarkTheamScreen({Key? key}) : super(key: key);

  @override
  State<DarkTheamScreen> createState() => _DarkTheamScreenState();
}

class _DarkTheamScreenState extends State<DarkTheamScreen> {

  @override
  Widget build(BuildContext context) {
    final theamChanger=Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,

      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
             title:Text( 'Light Mode'),
              value: ThemeMode.light,
              groupValue:theamChanger.themeMode,
              onChanged: theamChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title:Text( 'Dark Mode'),
              value: ThemeMode.dark,
              groupValue:theamChanger.themeMode,
              onChanged: theamChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title:Text( 'System Mode'),
              value: ThemeMode.system,
              groupValue:theamChanger.themeMode,
              onChanged: theamChanger.setTheme
          )
        ],
      ),
    );
  }
}
