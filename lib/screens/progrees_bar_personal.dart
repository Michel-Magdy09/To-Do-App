import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new5/provider/task_data.dart';

class Line2 extends StatelessWidget {
  Color? filledColor, lineColor;
  double? lineHeight, lineWidth, borderRadius;
  int? percentageDone;

  Line2({
    Key? key,
    this.filledColor = Colors.pink,
    this.lineColor = Colors.grey,
    this.lineHeight = 10,
    this.lineWidth = 100,
    this.percentageDone = 50,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(percentageDone);
    return ClipRRect(
      borderRadius: BorderRadius.circular((borderRadius ?? 0)),
      child: SizedBox(
        height: lineHeight,
        width: lineWidth,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: filledColor,
                height: lineHeight,
                width: lineWidth,
              ),
              flex: (percentageDone ?? 1),
            ),
            Expanded(
              flex: 100 - (percentageDone ??1),
              child: Container(
                color: lineColor,
                height: lineHeight,
                width: lineWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
