import 'package:attendence/data/color.dart';
import 'package:attendence/data/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class PresntList extends StatefulWidget {
  final List<Model> fullList;
  PresntList(this.fullList);

  @override
  State<PresntList> createState() => _PresntListState();
}

class _PresntListState extends State<PresntList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppColor.cardcolor, borderRadius: BorderRadius.circular(12)),
        child: widget.fullList.isEmpty
            ? Column(
                children: [],
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.fullList.length,
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
                        "${Jiffy(widget.fullList[index].date).format("MMM d, yyyy      ")}",
                        style: myStyle(16, AppColor.tapcolor),
                      ),
                      title: Text(
                        "Classes: ${widget.fullList[index].tot_class}",
                        style: myStyle(16, AppColor.tapcolor),
                      ),
                      subtitle: Text(
                        "Present: ${widget.fullList[index].pres}",
                        style: myStyle(16, AppColor.tapcolor),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          //onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: AppColor.redcolor,
                            size: 20,
                          )),
                    ),
                  );
                },
              ));
  }
}

myStyle(double size, Color clr, [FontWeight? fw]) {
  return GoogleFonts.alegreya(fontSize: size, color: clr, fontWeight: fw);
}
