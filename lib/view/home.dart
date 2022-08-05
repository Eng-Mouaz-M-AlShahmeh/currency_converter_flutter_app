/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_converter_flutter_app/controller/currency_provider.dart';
import 'package:currency_converter_flutter_app/view/widgets/text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

TextEditingController? controller1;
TextEditingController? controller2;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrencyProvider currencyProviderRead = context.read<CurrencyProvider>();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Currency Converter',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Theme.of(context).backgroundColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<CurrencyProvider>(
                        builder: (context, currency, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          currency.fromCurrency!.flag!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Consumer<CurrencyProvider>(
                          builder: (context, currency, child) {
                        return Autocomplete<String>(
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            } else {
                              return currencyProviderRead.autoCompleteDataFrom
                                  .where((word) => word.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase()));
                            }
                          },
                          optionsViewBuilder:
                              (context, Function(String) onSelected, options) {
                            return Material(
                              elevation: 4,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);

                                  return ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        currency.listCurrencies
                                            .where((element) =>
                                                element!.shortTitle == option)
                                            .first!
                                            .flag!,
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    title: SubstringHighlight(
                                      text: option.toString(),
                                      term: controller1!.text,
                                      textStyleHighlight: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    subtitle: Text(currency.listCurrencies
                                        .where((element) =>
                                            element!.shortTitle == option)
                                        .first!
                                        .title!),
                                    onTap: () {
                                      currencyProviderRead.setFromCurrency(
                                          currencyProviderRead.listCurrencies
                                              .where((element) =>
                                                  element!.shortTitle ==
                                                  option.toString())
                                              .first!);
                                      onSelected(option.toString());
                                      FocusScope.of(context).unfocus();
                                    },
                                  );
                                },
                                itemCount: options.length,
                              ),
                            );
                          },
                          onSelected: (selectedString) {
                            currencyProviderRead.setFromCurrency(
                                currencyProviderRead.listCurrencies
                                    .where((element) =>
                                        element!.shortTitle ==
                                        selectedString.toString())
                                    .first!);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onEditingComplete) {
                            controller1 = controller;
                            return iTextFormFieldCurrency(
                                context,
                                currency.fromCurrency!.shortTitle!,
                                controller1,
                                focusNode,
                                onEditingComplete);
                          },
                        );
                      }),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          controller1!.clear();
                          controller2!.clear();
                          currencyProviderRead.reverse(
                              currencyProviderRead.fromCurrency,
                              currencyProviderRead.toCurrency);
                        },
                        child: Icon(
                          Icons.compare_arrows,
                          size: 50,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Consumer<CurrencyProvider>(
                        builder: (context, currency, child) {
                          return Autocomplete<String>(
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<String>.empty();
                              } else {
                                return currencyProviderRead.autoCompleteDataTo
                                    .where((word) => word
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase()));
                              }
                            },
                            optionsViewBuilder: (context,
                                Function(String) onSelected, options) {
                              return Material(
                                elevation: 4,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    final option = options.elementAt(index);

                                    return ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          currency.listCurrencies
                                              .where((element) =>
                                                  element!.shortTitle == option)
                                              .first!
                                              .flag!,
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      title: SubstringHighlight(
                                        text: option.toString(),
                                        term: controller2!.text,
                                        textStyleHighlight: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      subtitle: Text(currency.listCurrencies
                                          .where((element) =>
                                              element!.shortTitle == option)
                                          .first!
                                          .title!),
                                      onTap: () {
                                        currencyProviderRead.setToCurrency(
                                            currencyProviderRead.listCurrencies
                                                .where((element) =>
                                                    element!.shortTitle ==
                                                    option.toString())
                                                .first!);
                                        onSelected(option.toString());
                                        FocusScope.of(context).unfocus();
                                      },
                                    );
                                  },
                                  itemCount: options.length,
                                ),
                              );
                            },
                            onSelected: (selectedString) {
                              currencyProviderRead.setToCurrency(
                                  currencyProviderRead.listCurrencies
                                      .where((element) =>
                                          element!.shortTitle ==
                                          selectedString.toString())
                                      .first!);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (context, controller, focusNode,
                                onEditingComplete) {
                              controller2 = controller;
                              return iTextFormFieldCurrency(
                                  context,
                                  currency.toCurrency!.shortTitle!,
                                  controller2,
                                  focusNode,
                                  onEditingComplete);
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Consumer<CurrencyProvider>(
                        builder: (context, currency, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          currency.toCurrency!.flag!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<CurrencyProvider>(
                      builder: (context, currency, child) {
                        return Expanded(
                          child: AutoSizeText(
                            '${currency.amount!.isNotEmpty ? currency.amount! : '1.0'} ${currency.fromCurrency!.shortTitle} = ${((double.tryParse(currency.fromCurrency!.factor!)! / num.tryParse(currency.toCurrency!.factor!)!) * num.tryParse(currency.amount!.isNotEmpty ? currency.amount! : '1.0')!).toStringAsFixed(2)} ${currency.toCurrency!.shortTitle}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40),
                            maxLines: 1,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueGrey[200],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(70,40,70,20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: iTextFormField(
                        context,
                        'Amount',
                        'Enter Amount',
                        Icons.attach_money,
                        (val) => currencyProviderRead.setAmount(val),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
