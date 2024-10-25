import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Background
const Color primaryBgColor = Colors.blueGrey;
const Color secondaryBgColor = Colors.lightBlue;
//Text
const Color primaryTextColor = Colors.black;
const Color secondaryTextColor = Colors.white;

final textTitle = GoogleFonts.lato(
  fontSize: 28,
  color: primaryTextColor,
  fontWeight: FontWeight.w700,
);

final textSubTitle = GoogleFonts.lato(
  fontSize: 20,
  color: secondaryTextColor,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);