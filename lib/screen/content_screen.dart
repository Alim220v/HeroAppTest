import 'package:flutter/material.dart';
import 'package:flutter_app_test_for_work/components/DataCard2.dart';

import 'package:flutter_app_test_for_work/modules/constants.dart';

class ContentPage extends StatelessWidget {
  static const String id = "content__page_screen";
  @override
  Widget build(BuildContext context) {
    final heroes = ModalRoute.of(context)!.settings.arguments as List;
    final curentHero = heroes[0];
    String title = curentHero["name"];
    var imageUrl = curentHero["image"]["url"];
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          backgroundColor: kGreyColor,
          appBar: AppBar(
              backgroundColor: kOrangeColor,
              centerTitle: true,
              title: Text(title)),
          body: Scrollbar(
            child: ListView(children: [
              Container(
                child: Image.network(
                  imageUrl,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.network(
                        "https://external-preview.redd.it/hjUjls1QGSlbHpA6D00rAXZ6-RxJMyCyz7Hg3tPqFco.jpg?auto=webp&s=d5a1923f135d6cf6bf00b6d6ff3fe6125ff82ac2");
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: DataCard2(
                          property: "powerstats", curentHero: curentHero)),
                  Expanded(
                    child: DataCard2(
                        property: "appearance", curentHero: curentHero),
                  )
                ],
              ),
              DataCard2(property: "biography", curentHero: curentHero),
              DataCard2(property: "work", curentHero: curentHero),
              DataCard2(property: "connections", curentHero: curentHero),
            ]),
          )),
    );
  }
}
