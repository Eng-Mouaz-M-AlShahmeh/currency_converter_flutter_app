/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';

OutlinedButton iOutlinedButton(BuildContext context, GlobalKey<FormState> key,
    String text, Function func) =>
    OutlinedButton(
      onPressed: () async {
        if (!key.currentState!.validate()) {
          return;
        } else {
          func();
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
        MaterialStateProperty.all(Theme.of(context).primaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );

OutlinedButton iOutlinedButtonNoKey(BuildContext context,
    String text, Function func) =>
    OutlinedButton(
      onPressed: () async {
        func();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
        MaterialStateProperty.all(Theme.of(context).primaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );