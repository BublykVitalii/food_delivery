import 'package:flutter/material.dart';

// ---Parameters---
const _kPadding = 50.0;
const _kFontSize = 34.0;

class TopText extends StatelessWidget {
  const TopText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.001;
    double multiplier = _kFontSize;

    return Padding(
      padding: EdgeInsets.only(
        left: _kPadding,
        top: MediaQuery.of(context).size.height / 100 * 2,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: multiplier * unitHeightValue),
        ),
      ),
    );
  }
}
