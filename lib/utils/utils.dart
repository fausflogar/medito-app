import 'package:Medito/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String blankIfNull(String s) {
  if (s == null)
    return "";
  else
    return s;
}

formatDuration(Duration d) {
  var s = d.toString().split('.').first;
  if (s.startsWith('0:0')) {
    s = s.replaceFirst('0:0', '');
  }
  return s;
}

TextTheme buildDMSansTextTheme(BuildContext context) {
  return GoogleFonts.dMSansTextTheme(Theme.of(context).textTheme.copyWith(
        title: TextStyle(
            fontSize: 22.0,
            height: 1.4,
            color: MeditoColors.lightColor,
            fontWeight: FontWeight.w600),
        subhead: TextStyle(
            fontSize: 16.0,
            height: 1.4,
            color: MeditoColors.lightTextColor,
            fontWeight: FontWeight.normal),
        display1: TextStyle(
            //pill big
            height: 1.4,
            fontSize: 18.0,
            color: MeditoColors.darkBGColor,
            fontWeight: FontWeight.normal),
        display2: TextStyle(
            //pill small
            fontSize: 14.0,
            height: 1.4,
            color: MeditoColors.lightColor,
            fontWeight: FontWeight.normal),
        display3: TextStyle(
            //this is for bottom sheet text
            fontSize: 16.0,
            height: 1.4,
            color: MeditoColors.lightColor,
            fontWeight: FontWeight.normal),
        display4: TextStyle(
            fontSize: 14.0,
            height: 1.4,
            color: MeditoColors.lightColor,
            fontWeight: FontWeight.w400),
        body2: TextStyle(
            //for 'MORE DETAILS'
            fontSize: 14.0,
            height: 1.4,
            color: MeditoColors.lightColor,
            fontWeight: FontWeight.w800),
      ));
}