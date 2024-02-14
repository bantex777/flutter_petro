// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertroqwiq/src/features/history/screen/transactionList.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _expandPersonal = false;
  bool _expandAddress = false;
  bool _expandPayments = false;

  bool _expandSecurity = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: FittedBox(
                    child: Image.asset(
                      "assets/profileheader.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Profile',
                              style: GoogleFonts.archivo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionList()),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Transactions',
                                style: GoogleFonts.archivo(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.ballot,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://mb.com.ph/wp-content/uploads/2021/01/061219_efren-bata-reyes11_vicoy-1024x838.jpg"),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : John Carlo Payabyab",
                        style: GoogleFonts.archivo(
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        "Truck Driver",
                        style: GoogleFonts.archivo(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  print(index);
                  print(isExpanded);
                  setState(() {
                    switch (index) {
                      case 0:
                        _expandPersonal = isExpanded;
                        _expandAddress = false;
                        _expandPayments = false;
                        _expandSecurity = false;
                        break;
                      case 1:
                        _expandAddress = isExpanded;
                        _expandPersonal = false;
                        _expandPayments = false;
                        _expandSecurity = false;
                        break; // The switch statement must be told to exit, or it will execute every case.
                      case 2:
                        _expandPayments = isExpanded;
                        _expandPersonal = false;
                        _expandAddress = false;
                        _expandSecurity = false;
                        break;
                      case 3:
                        _expandSecurity = isExpanded;
                        _expandPersonal = false;
                        _expandAddress = false;
                        _expandPayments = false;
                        break;
                      default:
                        print('choose a different number!');
                    }
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Personal Information',
                            style: GoogleFonts.archivo(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            )),
                      );
                    },
                    body: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Mobile Number: ",
                                      style: GoogleFonts.archivo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "0686565656",
                                      style: GoogleFonts.archivo(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Email: ",
                                      style: GoogleFonts.archivo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "jpayabyab06@gmail.com",
                                      style: GoogleFonts.archivo(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address: ",
                                      style: GoogleFonts.archivo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Eastwood livings Phase 4 blk 6 lot 23 Taytay rizal",
                                      style: GoogleFonts.archivo(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              height: 40,
                              width: 70,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.archivo(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(182, 0, 0, 0)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expandPersonal,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Registered Address',
                            style: GoogleFonts.archivo(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            )),
                      );
                    },
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Delete Address',
                                      style: GoogleFonts.archivo(
                                          color: const Color.fromARGB(
                                              141, 0, 0, 0),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                        )
                      ],
                    ),
                    isExpanded: _expandAddress,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Payments',
                            style: GoogleFonts.archivo(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            )),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Add Payment method',
                                  style: GoogleFonts.archivo(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Delete Payment method',
                                  style: GoogleFonts.archivo(
                                      color: const Color.fromARGB(141, 0, 0, 0),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                    height: 40,
                                    width: 80,
                                    image: AssetImage('assets/bpi.png')),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                    height: 40,
                                    width: 80,
                                    image: AssetImage('assets/bdo.png')),
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
                    isExpanded: _expandPayments,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Login and security',
                            style: GoogleFonts.archivo(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            )),
                      );
                    },
                    body: ListTile(
                      title: Text('Want to Log out?'),
                      subtitle: Text('Log out'),
                    ),
                    isExpanded: _expandSecurity,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
