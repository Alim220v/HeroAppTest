import 'dart:convert';
import 'package:http/http.dart' as http;

//Dr Manhattan
const List<String> requestList = ['233'];

const heroAPIURL = 'https://superheroapi.com/api/4847669015300316';

class HeroData {
  Future getHeroData(String selectedProperty) async {
    Map<String, dynamic> resultOfRequest = {};
    for (String requestSome in requestList) {
      var requestURL = Uri.parse('$heroAPIURL/$requestSome');
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        resultOfRequest = decodedData[selectedProperty];
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return resultOfRequest;
  }

  Future searchHero(String name) async {
    List<dynamic> resultOfRequest = [];
    var searchURL = Uri.parse('$heroAPIURL/search/$name');
    http.Response response = await http.get(searchURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      if (decodedData['response'] != "error") {
        resultOfRequest = decodedData["results"];
      }
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return resultOfRequest;
  }
}
