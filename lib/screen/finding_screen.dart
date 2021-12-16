import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/components/ListTileCustom.dart';
import 'package:flutter_app_test_for_work/modules/constants.dart';
import 'package:flutter_app_test_for_work/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FindingPage extends StatelessWidget {
  static const String id = "finding__results_screen";
  String title = "Results of findings";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          backgroundColor: kGreyColor,
          appBar: AppBar(
            backgroundColor: kOrangeColor,
            centerTitle: true,
            title: Text(
              title,
            ),
          ),
          body: StoreConnector<HeroSearch, HeroSearch>(
            converter: (store) => store.state,
            builder: (context, vm) => Scrollbar(
              child: ListView.builder(
                  itemCount: vm.searchResult.length,
                  itemBuilder: (context, index) => ListTileCustom(
                        heroes: vm.searchResult,
                        index: index,
                      )),
            ),
          )),
    );
  }
}
