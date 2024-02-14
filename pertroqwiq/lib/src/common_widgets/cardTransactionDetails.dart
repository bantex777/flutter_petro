// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTransactionDetails extends StatefulWidget {
  const CardTransactionDetails({super.key});

  @override
  State<CardTransactionDetails> createState() => _CardTransactionDetailsState();
}

class _CardTransactionDetailsState extends State<CardTransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, width: 1.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white10,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Image(
                          height: 100,
                          width: 100,
                          image: AssetImage('assets/truck1.png')),
                    ]),
                SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Drop off: 3A sto nino st santolan pasig',
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Delivered Liter: 4',
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Total Amount: Php 4000',
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
