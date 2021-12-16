import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/modules/constants.dart';
import 'package:flutter_app_test_for_work/modules/hero_data.dart';
import 'package:flutter_app_test_for_work/redux/action.dart';
import 'package:flutter_app_test_for_work/redux/state.dart';
import 'package:flutter_app_test_for_work/screen/finding_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  static const String id = "home_screen";
  String title = "I need a hero app";
  String name = "";

  @override
  Widget build(BuildContext context) {
    final Store<HeroSearch> store = StoreProvider.of<HeroSearch>(context);
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              //Форма поиска
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                      maxLines: 1,
                      maxLength: 30,
                      onChanged: (value) {
                        name = value;
                        store.dispatch(UpdateName(name));
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Type a hero name",
                          labelStyle: kTextStyle),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //
              //Конопка найти
              Card(
                child: Container(
                    width: 200,
                    child: TextButton(
                        onPressed: (() async {
                          try {
                            //Ищет героя
                            store.dispatch(
                                UpdateList(await HeroData().searchHero(name)));
                            if (store.state.searchResult.isNotEmpty) {
                              Navigator.pushNamed(context, FindingPage.id);
                            } else {
                              //Вывести информацию о том что не найдено
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Not Found!"),
                                duration: Duration(seconds: 2),
                              ));
                            }
                          } catch (e) {
                            print(e);
                          }
                        }),
                        child: Icon(
                          Icons.search,
                          size: 30,
                          color: kOrangeColor,
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
