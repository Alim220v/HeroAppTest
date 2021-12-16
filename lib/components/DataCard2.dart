import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/modules/string_extension.dart';
import 'package:flutter_app_test_for_work/modules/constants.dart';

class DataCard2 extends StatelessWidget {
  var curentHero;
  String property;

  DataCard2({required this.property, required this.curentHero});

  List<Widget> recieveData(context, Map heroInfo, String variable) {
    List<Widget> result = [];
    heroInfo[variable].forEach((key, value) {
      result.add(Text(
        key.toString().capitalize() + ":",
        style: kTextItalicStyle,
      ));
      result.add(Text(value.toString()));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8),
          child: Text(
            property.capitalize() + ":",
            style: kTextBoldStyle,
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recieveData(context, curentHero, property),
          ),
        )
      ],
    ));
  }
}
