import 'package:attendence/data/color.dart';
import 'package:attendence/data/model.dart';
import 'package:attendence/parts/newclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class NavBar extends StatefulWidget {
  final List<Model> myList;
  final Function deleteX;
  final Function deleteALL;
  NavBar(this.myList, this.deleteX, this.deleteALL);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void addNewItem(int cls, int prs, DateTime clsDate) {
    final newTx = Model(
        tot_class: cls,
        pres: prs,
        date: clsDate,
        id: DateTime.now().toString());

    setState(() {
      widget.myList.add(newTx);
    });
  }

  void startNewCls(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: AppColor.tapcolor,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewClass(addNewItem),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColor.cardcolor,
                borderRadius: BorderRadius.circular(12)),
            child: widget.myList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please ADD number of Classes and Presents",
                        style: myStyle(16, AppColor.tapcolor),
                      ),
                      Image.asset(
                        "images/desk.png",
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    ],
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.myList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: AppColor.tapcolor,
                        color: AppColor.cardcolor,
                        elevation: 4,
                        child: ListTile(
                          leading: Text(
                            "${Jiffy(widget.myList[index].date).format("MMM d, yyyy      ")}",
                            style: myStyle(16, AppColor.tapcolor),
                          ),
                          title: Text(
                            "Classes: ${widget.myList[index].tot_class}",
                            style: myStyle(16, AppColor.tapcolor),
                          ),
                          subtitle: Text(
                            "Present: ${widget.myList[index].pres}",
                            style: myStyle(16, AppColor.tapcolor),
                          ),
                          trailing: IconButton(
                              onPressed: () =>
                                  widget.deleteX(widget.myList[index].id),
                              icon: Icon(
                                Icons.delete,
                                color: AppColor.redcolor,
                                size: 20,
                              )),
                        ),
                      );
                    },
                  )),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.only(bottom: 10, left: 14, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () =>
                                  widget.deleteALL(widget.myList),
                  child: Text(
                    'Reset',
                    style:
                        GoogleFonts.alegreya(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.redcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () => startNewCls(context),
                  child: Text(
                    'Add   +',
                    style:
                        GoogleFonts.alegreya(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.tapcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

myStyle(double size, Color clr, [FontWeight? fw]) {
  return GoogleFonts.alegreya(fontSize: size, color: clr, fontWeight: fw);
}
