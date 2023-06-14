import 'package:advance_exam/ecomerce/search/provider/serach_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'ecomerce/search/view/serach_screen.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => Search_Provider(),)],
    child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) => serach(),
              },
            )),
  ));
}
