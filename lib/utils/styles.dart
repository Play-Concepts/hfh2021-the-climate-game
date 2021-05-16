import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climategame/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:climategame/utils/AppConstant.dart';

TextStyle primaryTextStyle(
    {int size = 16, Color textColor = cTextPrimaryColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle secondaryTextStyle(
    {int size = 14, Color textColor = cTextSecondaryColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle warningTextStyle(
    {int size = 14, Color textColor = cSecondaryColorRed}) {
  return TextStyle(
    fontSize: size.toDouble(),
    fontWeight: FontWeight.bold,
    color: textColor,
  );
}

TextStyle boldTextStyle(
    {int size = 18,
      Color textColor = cTextPrimaryColor,
      FontWeight textWeight = FontWeight.bold,
      double? letterSpacing,
      double? wordSpacing}) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: textColor,
      fontWeight: textWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing);
}

BoxDecoration boxDecorations(
    {double radius = 8,
      Color color = Colors.transparent,
      Color bgColor = Colors.white,
      var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [BoxShadow(color: cShadowColor, blurRadius: 10, spreadRadius: 2)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

BoxDecoration boxDecoration(
    {double radius = 80.0,
      Color backGroundColor = cPrimaryColor,
      double blurRadius = 8.0,
      double spreadRadius = 8.0,
      Color radiusColor = Colors.black12,
      required Gradient gradient}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: radiusColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
      color: backGroundColor,
      gradient: gradient);
}

class SDButton extends StatefulWidget {
  static String tag = '/T4Button';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 40.0;

  SDButton(
      {@required this.textContent,
        required this.onPressed,
        this.isStroked = false,
        this.height = 45.0});

  @override
  SDButtonState createState() => SDButtonState();
}

class SDButtonState extends State<SDButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: Text(
          widget.textContent,
          textAlign: TextAlign.center,
          style: boldTextStyle(
              size: 16, textColor: Colors.white, letterSpacing: 2),
        ),
        decoration: widget.isStroked
            ? boxDecorations(bgColor: Colors.transparent, color: cPrimaryColor)
            : boxDecorations(bgColor: cPrimaryColor, radius: 6),
      ),
    );
  }
}

changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

Widget Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('assets/images/grey.jpg', fit: BoxFit.cover);

Widget text(
    String text, {
      var fontSize = textSizeLargeMedium,
      Color? textColor,
      var fontFamily,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5,
      bool textAllCaps = false,
      var isLongText = false,
      bool lineThrough = false,
    }) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}