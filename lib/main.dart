import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/Screen/main_screen.dart';
import 'package:flutter_app_test_for_work/redux/state.dart';
import 'package:flutter_app_test_for_work/redux/reducer.dart';
import 'package:flutter_app_test_for_work/screen/content_screen.dart';
import 'package:flutter_app_test_for_work/screen/finding_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<HeroSearch> state = Store(
    reducer,
    initialState: HeroSearch(name: "", searchResult: []),
  );
  runApp(StoreProvider(store: state, child: MyAppTestForWork()));
}

class MyAppTestForWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        FindingPage.id: (context) => FindingPage(),
        ContentPage.id: (context) => ContentPage()
      },
      initialRoute: MyHomePage.id,
    );
  }
}
