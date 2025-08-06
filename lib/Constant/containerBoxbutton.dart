import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final double containerWidth;
  final String itext;
  final Color bgColor;
  final VoidCallback? onTap;

  const ContainerButton({
    Key? key,
    required this.containerWidth,
    required this.itext,
    required this.bgColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: containerWidth,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            itext,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
