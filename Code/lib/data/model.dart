import 'package:flutter/material.dart';

class Model {
  final String? id;
  final DateTime? date;
  final int? tot_class;
  final int? pres;
  Model(
      {@required this.id,
      @required this.date,
      @required this.tot_class,
      @required this.pres});
}
