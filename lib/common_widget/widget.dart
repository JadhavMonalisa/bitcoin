import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

///circular progress indicator widget
buildCircularIndicator(){
  return const Center(
    child: Padding(
      padding: EdgeInsets.only(top: 30.0,bottom: 30.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CupertinoActivityIndicator(color: primaryColor,),
        ),
      ),
    ),
  );
}

///no data found widget
buildNoDataFound(BuildContext context,{Color color = blackColor}){
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
      child: buildTextBoldWidget("No Data Found", color, context, 14,),
    ),
  );
}

///textFormField title widget
buildTitleWidget(BuildContext context,String title){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: buildTextRegularWidget(title, titleTextColor,context,13,),
      ),
      const SizedBox(height: 5,),
    ],
  );
}

///font regular
buildTextRegularWidget(String title,Color textColor,BuildContext context,double textSize,{FontWeight fontWeight=FontWeight.w400,
  TextAlign align=TextAlign.justify,double letterSpacing=0.0,FontStyle fontStyle=FontStyle.normal,int maxLines=5,
  TextDecoration decoration=TextDecoration.none}){
  return Text(title,style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize,color: textColor, fontWeight: fontWeight, letterSpacing: letterSpacing,
    fontStyle: fontStyle, decoration:decoration,)), maxLines: maxLines, textAlign: align);
}

///font medium
buildTextMediumWidget(String title,Color textColor,BuildContext context,double textSize,{FontWeight fontWeight=FontWeight.w700,
  TextAlign align=TextAlign.justify,double letterSpacing=0.0,FontStyle fontStyle=FontStyle.normal,int maxLines=5,
  TextDecoration decoration=TextDecoration.none,bool toUpperCase=false}){
  return Text(toUpperCase?title.toUpperCase():title,style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize,color: textColor, fontWeight: fontWeight, letterSpacing: letterSpacing,
      fontStyle: fontStyle, decoration:decoration)),maxLines: maxLines, textAlign: align,);
}

///font bold
buildTextBoldWidget(String title,Color textColor,BuildContext context,double textSize,{FontWeight fontWeight=FontWeight.bold,
  TextAlign align=TextAlign.left,double letterSpacing=0.0,FontStyle fontStyle=FontStyle.normal,int maxLines=5,
  TextDecoration decoration=TextDecoration.none,}){
  return Text(title,style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize,color: textColor, fontWeight: fontWeight, letterSpacing: letterSpacing,
      fontStyle: fontStyle, decoration:decoration)),maxLines: maxLines, textAlign: align);
}

