import 'package:flutter/material.dart';

class SizedButton extends StatelessWidget {
  SizedButton(
      {required this.onPressed,
      required this.text,
      required this.width,
      required this.height,
      required this.fontSize});

  final GestureTapCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(seconds: 2),
          elevation: 20,
          primary: Colors.green,
          onPrimary: Colors.green,
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, fontFamily: "Poppins", color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {required this.onPressed,
      required this.text,
      required this.flex,
      required this.fontSize,
      required this.width,
      required this.color});

  final GestureTapCallback onPressed;
  final String text;
  final int flex;
  final double fontSize;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            animationDuration: const Duration(seconds: 2),
            elevation: 20,
            primary: color,
            onPrimary: color,
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.white),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedButtonRow extends StatelessWidget {
  const ExpandedButtonRow({
    required this.onPressed,
    required this.text,
    required this.flex,
    required this.fontSize,
    required this.height,
  });

  final GestureTapCallback onPressed;
  final String text;
  final int flex;
  final double fontSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            animationDuration: const Duration(seconds: 2),
            elevation: 20,
            primary: Colors.green,
            onPrimary: Colors.green,
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.white),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
