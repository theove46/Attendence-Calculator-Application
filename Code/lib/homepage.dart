import 'package:attendence/data/model.dart';
import 'package:attendence/parts/chart.dart';
import 'package:attendence/data/color.dart';
import 'package:attendence/parts/navbar.dart';
import 'package:attendence/parts/present_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Model> myList = [
    // Model(tot_class: 3, pres: 3, date: DateTime.now()),
    // Model(tot_class: 3, pres: 3, date: DateTime.now()),
  ];

  List<Model> get sumList {
    return myList;
  }

  void deleteCls(String id) {
    setState(() {
      myList.removeWhere((tx) => tx.id == id);
    });
  }

  void deleteAll() {
      setState(() {
        myList.clear();
        //for (var id = 0; id < myList.length; id++)
        //myList.removeWhere((tx) => tx.id == id);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.all(14),
                child: Chart(sumList)),
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.5,
            //     padding: EdgeInsets.only(left: 14, right: 14, bottom: 14),
            //     child: PresntList(myList)),
            Container(
                //height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.only(bottom: 10, left: 14, right: 14),
                child: NavBar(myList, deleteCls, deleteAll)),
          ],
        ),
      ),
    );
  }
}
