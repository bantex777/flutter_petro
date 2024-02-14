// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabOrderDetails extends StatefulWidget {
  const TabOrderDetails({super.key});

  @override
  State<TabOrderDetails> createState() => _TabOrderDetailsState();
}

class _TabOrderDetailsState extends State<TabOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(49, 197, 197, 197),
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color.fromARGB(21, 0, 0, 0)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  size: 32,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'My cart',
                  style: GoogleFonts.archivo(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 40,
                  height: 10,
                  child: Divider(
                    height: 10,
                    color: Color.fromARGB(37, 124, 124, 124),
                    thickness: 2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(91, 106, 106, 106),
                  ),
                  child: Text('2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Payment',
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(91, 106, 106, 106),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 40,
                  height: 10,
                  child: Divider(
                    height: 10,
                    color: Color.fromARGB(37, 124, 124, 124),
                    thickness: 2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(91, 106, 106, 106),
                  ),
                  child: Text('3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Status',
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(91, 106, 106, 106),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
