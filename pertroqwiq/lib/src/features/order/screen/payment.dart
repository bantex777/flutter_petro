// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pertroqwiq/src/features/order/screen/receipt.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  var paymentBanks = [
    SizedBox(height: 120, width: 120, child: Image.asset('assets/bpi.png')),
    SizedBox(height: 120, width: 120, child: Image.asset('assets/bdo.png')),
    SizedBox(height: 120, width: 120, child: Image.asset('assets/pnb.png')),
  ];

  var paymentEwalley = [
    SizedBox(height: 120, width: 120, child: Image.asset('assets/gcash.png')),
    SizedBox(
        height: 120, width: 120, child: Image.asset('assets/bayadcenter.png')),
  ];

  var paymentCreditCard = [
    SizedBox(height: 120, width: 120, child: Image.asset('assets/aa.png')),
    SizedBox(height: 120, width: 120, child: Image.asset('assets/visa.png')),
    SizedBox(
        height: 120, width: 120, child: Image.asset('assets/mastercard.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Petro Qwiq', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Payment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Reference #: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    '96585465',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Customer #: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    'Oliver Cromwell',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Address #: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    'Nagtahan sampaloc blk 55 lot 3',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Order',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  children: [
                    Image.asset('assets/pump.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diesel (Euro 5)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Php 45.00',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '800 liters',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Banks',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: paymentBanks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                      width: 110,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Center(
                        child: paymentBanks[index],
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Credit Card',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: paymentCreditCard.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                      width: 110,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Center(
                        child: paymentCreditCard[index],
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'E-Wallet',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: paymentEwalley.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                      width: 110,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Center(
                        child: paymentEwalley[index],
                      )),
                ),
              ),
            ]),
          ),
        ));
  }
}
