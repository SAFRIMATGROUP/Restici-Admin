import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.isCentered = false,
    this.strokeWidth = 4,
    this.color,
  }) : isPagination = false;

  const AppLoader.center({
    super.key,
    this.strokeWidth = 4,
    this.color,
  })  : isCentered = true,
        isPagination = false;

  const AppLoader.pagination({
    super.key,
    this.strokeWidth = 4,
    this.color
  })  : isCentered = true,
        isPagination = true;

  final bool isCentered;
  final bool isPagination;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if(isPagination){
      return  CupertinoActivityIndicator(
        color: color,
      );
    }
    if (isCentered) {
      return Center(
          child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
            color: color,
      ));
    }
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      color: color,
    );
  }
}
