import 'package:attendence/data/color.dart';
import 'package:attendence/data/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Chart extends StatelessWidget {
  final List<Model> myList;
  Chart(this.myList);

  int total = 0;
  int present = 0;
  double perc = 0;
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < myList.length; i++) {
      {
        total += myList[i].tot_class.hashCode;
        present += myList[i].pres.hashCode;
      }
    }
    perc = present / total * 100;

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "Attendence Calculator",
              style: GoogleFonts.alegreya(
                  color: AppColor.txtcolor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: AppColor.tapcolor,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Classes",
                              style: GoogleFonts.alegreya(
                                  color: AppColor.txtcolor, fontSize: 16),
                            ),
                            Text(
                              //"$total",
                              '${total.toStringAsFixed(0)}',
                              style: GoogleFonts.lato(
                                  color: AppColor.txtcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: AppColor.tapcolor,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Presents",
                              style: GoogleFonts.alegreya(
                                  color: AppColor.txtcolor, fontSize: 16),
                            ),
                            Text(
                              //"$present",
                              '${present.toStringAsFixed(0)}',
                              style: GoogleFonts.lato(
                                  color: AppColor.txtcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: AppColor.tapcolor,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Overall Percentages",
                      style: GoogleFonts.alegreya(
                          color: AppColor.txtcolor, fontSize: 16),
                    ),
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 12.0,
                      percent: perc * 0.01,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text(
                            (total > 0) ? '${perc.toStringAsFixed(0)}%' : ' ',
                            style: GoogleFonts.lato(
                                color: (perc >= 75)
                                    ? AppColor.greencolor
                                    : AppColor.redcolor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (total == 0) ? ' ' : (perc >= 75) ? 'Safe List' : 'Defaulter List',
                            style: GoogleFonts.alegreya(
                                color: (perc >= 75)
                                    ? AppColor.greencolor
                                    : AppColor.redcolor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      progressColor: (perc >= 75 || total == 0)
                          ? AppColor.greencolor
                          : AppColor.redcolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
