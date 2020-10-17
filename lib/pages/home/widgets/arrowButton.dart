import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ArrowButtonDirection {
  up,
  down
}

class ArrowButton extends StatelessWidget {
  final Function onPressed;
  final ArrowButtonDirection direction;
  bool active = true;

  ArrowButton({@required this.onPressed, @required this.direction, @required this.active});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: onPressed,
      icon: direction == ArrowButtonDirection.up ? Transform.rotate(
          angle: 3.14,
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 25,
            color: active ? Colors.black : Colors.grey,
          )) : SvgPicture.asset('assets/icons/arrow.svg', width: 25, color: active ? Colors.black : Colors.grey,),
    );
  }
}