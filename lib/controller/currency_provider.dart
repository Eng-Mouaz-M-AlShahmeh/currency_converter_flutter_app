/* Developed by: Eng Mouaz M. Al-Shahmeh
*  Date: 05/08/2022
* */
import 'dart:convert';
import 'package:currency_converter_flutter_app/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyProvider extends ChangeNotifier {
  // initialize data
  String? _amount = '1.0';
  final List<String> _autoCompleteDataFrom = [];
  final List<String> _autoCompleteDataTo = [];
  final List<CurrencyModel?> _listCurrencies = [];
  CurrencyModel? _fromCurrency = CurrencyModel(
      shortTitle: 'SAR',
      title: 'Saudi Arabian Riyal',
      flag: 'assets/images/flags/sar.png',
      factor: '0.2663');
  CurrencyModel? _toCurrency = CurrencyModel(
      shortTitle: 'USD',
      title: 'United States Dollar',
      flag: 'assets/images/flags/usd.png',
      factor: '1.0');

  // setters
  setAmount(String val) async {
    _amount = val;
    notifyListeners();
  }

  getAllCurrencies() async {
    final String response =
        await rootBundle.loadString('assets/data/currencies.json');
    final data = await json.decode(response);
    _listCurrencies.clear();
    _autoCompleteDataFrom.clear();
    _autoCompleteDataTo.clear();
    for (int i = 0; i < data["data"].length; i++) {
      _listCurrencies.add(CurrencyModel.fromJson(data["data"][i]));
      _autoCompleteDataFrom.add(data["data"][i]["shortTitle"]);
      _autoCompleteDataTo.add(data["data"][i]["shortTitle"]);
    }
    notifyListeners();
    return;
  }

  setFromCurrency(CurrencyModel val) async {
    _fromCurrency = val;
    notifyListeners();
  }

  setToCurrency(CurrencyModel val) async {
    _toCurrency = val;
    notifyListeners();
  }

  reverse(CurrencyModel? from, CurrencyModel? to) {
    _fromCurrency = to;
    _toCurrency = from;
    notifyListeners();
  }

  // getters
  String? get amount => _amount;
  List<CurrencyModel?> get listCurrencies => _listCurrencies;
  List<String> get autoCompleteDataFrom => _autoCompleteDataFrom;
  List<String> get autoCompleteDataTo => _autoCompleteDataTo;
  CurrencyModel? get fromCurrency => _fromCurrency;
  CurrencyModel? get toCurrency => _toCurrency;
}
