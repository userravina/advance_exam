import 'package:advance_exam/ecomerce/search/modal/serach_modal.dart';
import 'package:advance_exam/ecomerce/search/provider/serach_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class serach extends StatefulWidget {
  const serach({super.key});

  @override
  State<serach> createState() => _serachState();
}

class _serachState extends State<serach> {
  Search_Provider? pt;
  Search_Provider? pf;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<Search_Provider>(context, listen: false);
    pt = Provider.of<Search_Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade200,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Ecommerce",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 140, top: 15),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/insta2.jpeg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon:
                          Icon(Icons.search, color: Colors.grey.shade700)),
                ),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, value, child) => FutureBuilder(
                  future: pt!.serachsetdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error:-${snapshot.hasError}");
                    } else if (snapshot.hasData) {
                      SerachModal search = snapshot.data!;
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 20.h,
                                    width: 50.w,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                        "${search.data![index].productId}"),
                                  );
                                },
                                itemCount: search.data!.length),
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
