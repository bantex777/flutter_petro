// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTruckContainer extends StatefulWidget {
  const CardTruckContainer({super.key});

  @override
  State<CardTruckContainer> createState() => _CardTruckContainerState();
}

class _CardTruckContainerState extends State<CardTruckContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 80,
            width: 140,
            margin: EdgeInsets.only(left: 35),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 232, 232),
                border: Border.all(color: Color.fromARGB(95, 74, 74, 74)),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'DIESEL',
                    style: GoogleFonts.archivo(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Php 10',
                    style: GoogleFonts.archivo(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Image(height: 80, width: 125, image: AssetImage('assets/truck1.png')),
        ],
      ),
    );
  }
}
