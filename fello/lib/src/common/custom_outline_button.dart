import 'package:fello/src/common/sleek_outline_widget.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.title,
    this.padding,
    this.onTap,
    this.width,
  });

  final String title;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SleekOutlineWidget(
      width: width,
      padding: padding,
      child: InkWell(
        splashColor: Colors.deepPurple,
        onTap: onTap,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: txtTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
