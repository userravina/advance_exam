import 'package:advance_exam/ecomerce/search/modal/serach_modal.dart';
import 'package:advance_exam/utils/Api_helper/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Search_Provider extends ChangeNotifier
{
  // List<SerachModal> mainlist=[];
  SerachModal serachModal = SerachModal();
   Future<SerachModal> serachsetdata()
   async {
     Api_helper api_helper = Api_helper();
      return await api_helper.serachapi();
     // mainlist = serachModal.data!.cast<SerachModal>();
     // print(mainlist);
     notifyListeners();
   }
}