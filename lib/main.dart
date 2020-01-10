import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/pokemons_provider.dart';
import 'package:testapp/screens/homeScreen.dart';
import 'package:testapp/screens/auth/forgot_password_screen.dart';
import 'package:testapp/screens/auth/register_screen.dart';
import 'package:testapp/screens/auth/login_screen.dart';
import 'package:testapp/screens/in/calculator_screen.dart';
import 'package:testapp/screens/in/degrees_conversion_screen.dart';
import 'package:testapp/screens/in/home_screen.dart';
import 'package:testapp/screens/in/pokedex_screen.dart';
import 'package:testapp/providers/user_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff008397),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/auth/login': (context) => LoginScreen(),
        '/auth/register': (context) => RegisterScreen(),
        '/auth/forgot_password': (context) => ForgotPasswordScreen(),
        '/in': (context) => InHomeScreen(),
        '/in/calculator': (context) => CalculatorScreen(),
        '/in/degrees_conversion': (context) => DegreesConversionScreen(),
        '/in/pokedex': (context) => PokedexScreen(),
      },
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
        ChangeNotifierProvider<PokemonsProvider>(create: (context) => PokemonsProvider()),
      ],
      child: app
    );
  }
}
