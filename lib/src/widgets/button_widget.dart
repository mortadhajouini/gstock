
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? width;
  final double? height;

  const BottomNavigationButton(
      {super.key, required this.onPressed, required this.text, this.width , this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 80.h, 
      alignment: Alignment.bottomCenter,
      child: TextButton( 
        style:ButtonStyle (
          fixedSize:  MaterialStateProperty.all(Size(width??327.w, height??  54.h))
        ),
          onPressed: () => onPressed.call(),
          child: Text(
            text,
          )),
    );
  }
}
