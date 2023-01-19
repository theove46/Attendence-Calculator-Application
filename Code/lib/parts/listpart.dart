import 'package:attendence/data/model.dart';
import 'package:attendence/parts/newclass.dart';
import 'package:flutter/material.dart';

class ListPart extends StatefulWidget {
  @override
  State<ListPart> createState() => _ListPartState();
}

class _ListPartState extends State<ListPart> {
  void addNewItem(int cls, int prs) {
    final newTx = Model(tot_class: cls, pres: prs, date: DateTime.now());

    // setState(() {
    //   myList.add(newTx);
    // });
  }
  // void startNewCls(BuildContext ctx){
  //   showModalBottomSheet(context: ctx, builder: (_){
  //     return NewClass(addNewItem);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: NewClass(addNewItem)),
          // Container(
          //     height: MediaQuery.of(context).size.height * 0.3,
          //     child: PresntList(myList)),
        ],
      ),
    );
  }
}
