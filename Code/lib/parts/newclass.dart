import 'package:attendence/data/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class NewClass extends StatefulWidget {
  final Function addTx;
  NewClass(this.addTx);

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  final classesController = TextEditingController();
  final presentController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    if (classesController.text.isEmpty 
    //||
      //  presentController.text.isEmpty ||
        //selectedDate == null
        ) {
      return;
    }
    final enterCls = int.parse(classesController.text);
    final enterPrs = int.parse(presentController.text);

    if (enterCls < 0 ||
        enterPrs < 0 ||
        enterCls < enterPrs ||
        _selectedDate == null) {
      return;
    }
    widget.addTx(int.parse(classesController.text),
        int.parse(presentController.text), _selectedDate);
    setState(() {

    });

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.tapcolor,
              onPrimary: AppColor.txtcolor,
              onSurface: AppColor.tapcolor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColor.tapcolor,
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.cardcolor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: AppColor.tapcolor,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: 'Number of Classes',
                labelStyle: GoogleFonts.alegreya(
                    fontSize: 16, color: AppColor.tapcolor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.bgcolor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.tapcolor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: classesController,
              onSubmitted: (_) => submitData,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.alegreya(
                  fontSize: 18,
                  color: AppColor.tapcolor,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: 'Number of Presents',
                labelStyle: GoogleFonts.alegreya(
                    fontSize: 16, color: AppColor.tapcolor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.bgcolor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.tapcolor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: presentController,
              onSubmitted: (_) => submitData(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    _selectedDate == null
                        ? "Please Select a date!"
                        : "Date: ${Jiffy(_selectedDate).format("MMM d, yyyy")}",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: AppColor.tapcolor,
                    )),
                InkWell(
                    onTap: presentDatePicker,
                    child: Text(
                      "Choose Class Date",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          color: AppColor.tapcolor,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: submitData,
              child: Text(
                'Add Attendence',
                style: GoogleFonts.alegreya(fontSize: 16, color: Colors.white),
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
    );
  }
}
