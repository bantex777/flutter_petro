import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBlackSubmit extends StatefulWidget {
  const ButtonBlackSubmit({super.key});

  @override
  State<ButtonBlackSubmit> createState() => _ButtonBlackSubmitState();
}

class _ButtonBlackSubmitState extends State<ButtonBlackSubmit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          'Book Now!',
          style: GoogleFonts.archivo(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
