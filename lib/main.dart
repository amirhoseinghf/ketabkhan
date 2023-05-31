import 'package:flutter/material.dart';
import 'package:ketabkhan/screens/details_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ketabkhan",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 94, 160, 1),
        accentColor: Color.fromRGBO(63, 220, 255, 1),
        canvasColor: Color.fromRGBO(221, 240, 255, 1),
        fontFamily: "IranSans",
        appBarTheme: AppBarTheme(color: Theme.of(context).primaryColor),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16, textBaseline: TextBaseline.alphabetic),
            bodySmall: TextStyle(color: Colors.white, fontSize: 12),
          headlineSmall: TextStyle(color: Colors.black, fontSize: 24),
        titleSmall: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 16),
          titleMedium: TextStyle(color: Color.fromRGBO(11, 94, 160, 1), fontSize: 20),

        ),
        buttonTheme: ButtonThemeData(buttonColor: Color.fromRGBO(11, 94, 160, 1),)
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
      },
    );
  }
}
