/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:currency_converter_flutter_app/controller/currency_provider.dart';
import 'package:currency_converter_flutter_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CurrencyProvider>().getAllCurrencies();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      return;
    });

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Text(
          'Currency Converter',
          style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).backgroundColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
