import 'dart:convert';

import 'package:advance_exam/ecomerce/search/modal/serach_modal.dart';
import 'package:http/http.dart' as http;

class Api_helper {
  Future<SerachModal> serachapi() async {
    String? like =
        "https://real-time-product-search.p.rapidapi.com/search?q=Nike%20shoes&country=us&language=en";

    var responce = await http.get(Uri.parse(like), headers: {
      "X-RapidAPI-Key": "a36e11a6bdmsh1ac81b542dd8110p146aaejsn49b23ad008fa",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com"
    });

    var json = jsonDecode(responce.body);
    print(json);
    SerachModal data = SerachModal.fromJson(json);

    return data;
  }
}
