/* Developed by Eng. Mouaz M. Al-Shahmeh */
import 'package:currency_converter_flutter_app/controller/currency_provider.dart';
import 'package:currency_converter_flutter_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey[800],
        backgroundColor: Colors.grey,
      ),
      home: const SplashScreen(),
    );
  }
}
