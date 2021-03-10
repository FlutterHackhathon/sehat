import 'package:flutter/material.dart';

class case_box extends StatelessWidget {
  final int top;
  final int mid;
  final int bottom;
  final Color col;
  final Widget child;
  case_box(
      {Key key,
      @required this.top,
      Key key2,
      @required this.mid,
      Key key3,
      @required this.bottom,
      Key key4,
      @required this.col,
      Key key5,
      @required this.child})
      
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width:100,
          child: Center(
            child: Container(
              width: 80,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Color(top),
                border: Border.all(width: 1.0, color: col),
              ),
            ),
          ),
        ),
        SizedBox(
          width:100,
          child: Center(
            child: Container(
              width: 90,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Color(mid),
                border: Border.all(width: 1.0, color: col),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            child:child,
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Color(bottom),
              border: Border.all(width: 1.0, color: col),
            ),
          ),
        ),
      ],
    );
  }
}
// 0xffF31D66
// 0xffFC4684
// 0xffFF71A1