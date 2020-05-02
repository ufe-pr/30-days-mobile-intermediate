import 'package:flutter/material.dart';


const BoxShadow bigBoxShadow = BoxShadow(
  color: Color(0x23575757),
  blurRadius: 30.31,
  offset: Offset(5.13, 10.13),
);

const BoxShadow smallBoxShadow = BoxShadow(
  color: Color(0x13575757),
  blurRadius: 70.31,
  offset: Offset(0.13, 8.13),
);


class MyCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final ShapeBorder shape;
  final Clip clipBehaviour;
  final EdgeInsets margin;
  final bool semanticContainer, borderOnForeground;
  final List<BoxShadow> boxShadow;

  const MyCard(
      {Key key,
        this.child,
        this.color,
        this.shape,
        this.clipBehaviour,
        this.margin,
        this.semanticContainer = true,
        this.borderOnForeground = true,
        this.boxShadow = const [bigBoxShadow]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: this.child,
        shape: this.shape,
        color: this.color,
        margin: this.margin,
        semanticContainer: this.semanticContainer,
        borderOnForeground: this.borderOnForeground,
        clipBehavior: this.clipBehaviour,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
    );
  }
}

