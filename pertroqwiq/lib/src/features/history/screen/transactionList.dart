// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertroqwiq/src/common_widgets/cardTransactionDetails.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        title: Text(
          'Transaction List',
          style: GoogleFonts.archivo(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.w100,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 204, 65, 255),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: 765',
                  style: GoogleFonts.archivo(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CardTransactionDetails(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
