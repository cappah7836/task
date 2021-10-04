import 'package:flutter/material.dart';


import '../../theme.dart';
class Buttons extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Buttons({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryClr
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
      ),
    );
  }
}
