import 'package:flutter_app_test_for_work/redux/state.dart';
import 'action.dart';

HeroSearch reducer(HeroSearch state, dynamic action) {
  if (action is UpdateList) {
    return HeroSearch(name: state.name, searchResult: action.searchResult);
  } else if (action is UpdateName) {
    return HeroSearch(name: action.name, searchResult: []);
  } else {
    return state;
  }
}
