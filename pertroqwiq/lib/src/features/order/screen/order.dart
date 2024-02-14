// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertroqwiq/src/common_widgets/loading.dart';
import 'package:pertroqwiq/src/features/order/screen/payment.dart';
import 'package:pertroqwiq/src/features/order/widget/tab.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String dropdownvalue = 'Item 1';
  bool isLoading = false;

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    super.initState();
    _delayScreen();
  }

  _delayScreen() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? const Loading()
      : Scaffold(
          appBar: AppBar(
            title: Text(
              'Order Details',
              style: GoogleFonts.archivo(color: Colors.white, fontSize: 18),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Help',
                  style: GoogleFonts.archivo(
                      color: Color.fromARGB(255, 215, 215, 215)),
                ),
              )
            ],
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabOrderDetails(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(),
                    child: Text(
                      'Post your ORDER',
                      style: GoogleFonts.archivo(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Post your ORDER',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Center(
                      child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/header.png'))),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            child:
                                ClipOval(child: Image.asset('assets/bata.jpg')),
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Plate Number: ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('TT3-TT3')
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Driver: ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('Cromwell Cristobal')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Product and Liters to buy',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors
                              .lightGreen, //background color of dropdown button
                          border: Border.all(
                              color: Colors.black38,
                              width: 3), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              50), //border raiuds of dropdown button
                          boxShadow: <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(
                          5,
                          (index) {
                            return Container(
                              color: Colors.blue,
                              margin: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  'Item $index',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Authorized Receiver',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Product Amount: ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text('10,000')
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'Freight Charge: ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text('10,00000')
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'Total Amount: ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text('20,000')
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.blue.withOpacity(0.04);
                              }
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.blue.withOpacity(0.12);
                              }
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]),
          ));
}
