import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/provider/favorite_provider.dart';
import 'package:providerexample/provider/theme_changer_provider.dart';
import 'package:providerexample/screen/dark_theam.dart';
import 'package:providerexample/screen/favorite_screen.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final theamChanger=Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>FavouriteItemProvider()),
        ChangeNotifierProvider(create:(_)=>ThemeChanger())
      ],

      child: Builder(
        builder: (BuildContext context) {
          final theamChanger=Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            themeMode: theamChanger.themeMode,

            theme: ThemeData(
              brightness: Brightness.light,

              primarySwatch: Colors.red
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal
              )

            ),
            home: DarkTheamScreen(),
          );
        }
      ),
    );
  }
}
