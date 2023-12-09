import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart'
    show
        Border,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Color,
        Container,
        EdgeInsets,
        EdgeInsetsGeometry,
        Offset,
        Radius,
        StatelessWidget,
        Widget;

class SleekOutlineWidget extends StatelessWidget {
  const SleekOutlineWidget({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.bgColor,
  });

  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[900],
        border: Border.all(
          width: 0.9,
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: padding ??
          const EdgeInsets.all(
            6,
          ),
      margin: margin ??
          const EdgeInsets.all(
            8,
          ),
      child: child,
    );
  }
}
