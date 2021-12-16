import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/screen/content_screen.dart';

class ListTileCustom extends StatelessWidget {
  final int index;
  final List heroes;

  ListTileCustom({this.index = 0, required this.heroes});

  String getName(context, int index) {
    String result = "";
    Map results = heroes[index] as Map;
    result = results["name"];
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return (Card(
      child: ListTile(
        onTap: () {
          Map results = heroes[index] as Map;
          Navigator.pushNamed(context, ContentPage.id, arguments: [results]);
        },
        title: Text(
          getName(context, index),
        ),
      ),
    ));
  }
}
