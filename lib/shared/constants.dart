///File description: Some reusable constants and components that are used throughout the app.
import 'package:flutter/material.dart';

///color palette
const color1 = Color(0xff353535);
const color2 = Color(0xff3c6e71);
const color3 = Color(0xffffffff);
const color4 = Color(0xffd9d9d9);
const color5 = Color(0xff284b63);
const color6 = Color(0xff963D14);
const color7 = Color(0xff6cb9f0);

///default app font size
double defaultFontSize = 20;

///app title
var title = "Defenderr";

///component for form text decoration
const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder( //field that is not in focus will have these border properties
        borderSide: BorderSide(color: Colors.white, width: 2.0)
    ),
    focusedBorder: OutlineInputBorder( //field that is not in focus will have these border properties
        borderSide: BorderSide(color: color1, width: 2.0)
    )
);

///component for decorating title text
const titleDecoration = TextStyle(
    color: color2,
    fontSize: 75,
    fontWeight: FontWeight.bold
);

///component for app description
class appDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Inform. Empower. Protect.", style: TextStyle(color: color2, fontSize: 18, fontStyle: FontStyle.italic));
  }
}
