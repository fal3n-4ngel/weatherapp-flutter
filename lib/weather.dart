import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 0),
      child: Text(
        'Cirus',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(44, 44, 44, 1),
            fontFamily: 'Poppins',
            fontSize: 69,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
    );
  }
}
