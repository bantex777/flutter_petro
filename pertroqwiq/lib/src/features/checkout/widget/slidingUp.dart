// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertroqwiq/src/common_widgets/buttons/buttonBookBlack.dart';
import 'package:pertroqwiq/src/common_widgets/cardTruckContainer.dart';

class SlidingUp extends StatefulWidget {
  const SlidingUp({super.key});

  @override
  State<SlidingUp> createState() => _SlidingUpState();
}

class _SlidingUpState extends State<SlidingUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Icon(
            Icons.horizontal_rule,
            size: 45,
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            'Choose you Gas type or swipe for more',
            style:
                GoogleFonts.archivo(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView(
              shrinkWrap: true,
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardTruckContainer(),
                CardTruckContainer(),
                CardTruckContainer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(27, 0, 0, 0),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Option',
                  style: GoogleFonts.archivo(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonBlackSubmit()
        ],
      ),
    );
  }
}
