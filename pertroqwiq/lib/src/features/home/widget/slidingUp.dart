// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_select/awesome_select.dart';
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
  double _currentSliderValue = 100;

  final TextEditingController _textFieldController = TextEditingController();

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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    'Choose you Gas type or swipe for more',
                    style: GoogleFonts.archivo(
                        fontSize: 12, fontWeight: FontWeight.w600),
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No. of Liters: ${_currentSliderValue.toInt()} L',
                      style: GoogleFonts.archivo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Slider(
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        thumbColor: Colors.black38,
                        value: _currentSliderValue,
                        max: 6000,
                        divisions: 200,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping To:',
                              style: GoogleFonts.archivo(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Add Address',
                                style: GoogleFonts.archivo(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(6.0),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(29, 232, 232, 232),
                            border: Border.all(
                                color: Color.fromARGB(95, 74, 74, 74)),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Home address:',
                                      style: GoogleFonts.archivo(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Santolan 3A sto nino street Pasig',
                                      style: GoogleFonts.archivo(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Contact: 0988123123123123',
                                      style: GoogleFonts.archivo(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Radio(
                                value: 1,
                                groupValue: 'qweqwe',
                                onChanged: (value) {
                                  setState(() {
                                    print("Button value: $value");
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(6.0),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(29, 232, 232, 232),
                            border: Border.all(
                                color: Color.fromARGB(95, 74, 74, 74)),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Office address:',
                                      style: GoogleFonts.archivo(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Podium tower Bonificio street Taguig',
                                      style: GoogleFonts.archivo(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Contact: 09881223123',
                                      style: GoogleFonts.archivo(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Radio(
                                value: 1,
                                groupValue: 'qweqwe',
                                onChanged: (value) {
                                  setState(() {
                                    print("Button value: $value");
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Add Payment',
                              style: GoogleFonts.archivo(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: GoogleFonts.archivo(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6.0),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                            height: 80,
                                            width: 100,
                                            image:
                                                AssetImage('assets/bpi.png')),
                                        Radio(
                                          value: 1,
                                          groupValue: 'qweqwe',
                                          onChanged: (value) {
                                            setState(() {
                                              print("Button value: $value");
                                            });
                                          },
                                        ),
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
                                  Container(
                                    padding: EdgeInsets.all(6.0),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.wallet,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Cash on Delivery',
                                              style: GoogleFonts.archivo(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Radio(
                                          value: 1,
                                          groupValue: 'qweqwe',
                                          onChanged: (value) {
                                            setState(() {
                                              print("Button value: $value");
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Amount: Php 5000',
                            style: GoogleFonts.archivo(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Freight Fee: Free',
                            style: GoogleFonts.archivo(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Total amount: Php 5000',
                            style: GoogleFonts.archivo(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBlackSubmit(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
