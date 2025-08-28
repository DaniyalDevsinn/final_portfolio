import 'package:final_portfolio/globles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextStyle{
  static TextStyle headertextstyle (){
    return GoogleFonts.signikaNegative(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor
    );
  }
static TextStyle monteseratStyle ({required Color color, required double width}){
    return GoogleFonts.montserrat(
      fontSize: width>=600?35:20,
      fontWeight: FontWeight.w800,
      color: color
    );
  }
static TextStyle headingStyle (){
    return GoogleFonts.rubikMoonrocks(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
      letterSpacing: 2,
      height: 3
    );
  }
  static TextStyle normalstyle (){
    return GoogleFonts.signikaNegative(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryColor,
      letterSpacing: 1,
      
    );
  }

}