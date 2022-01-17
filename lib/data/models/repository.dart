import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Repository {
  var flag = Image.network('');
  var icon = SvgPicture.asset('');
  String name = "undefined";
  String symbol = "undefined";
  double rateToUah = 1;
  Repository({
    required this.flag,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.rateToUah});
}