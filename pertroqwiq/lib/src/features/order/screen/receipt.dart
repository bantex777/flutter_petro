import 'package:flutter/material.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Petro Qwiq'),
          centerTitle: true,
          actions: const [IconButton(onPressed: null, icon: Icon(Icons.menu))],
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(children: [
          const Text('Receipt'),
          const Icon(Icons.payment),
          const Row(
            children: [
              Icon(Icons.barcode_reader),
              Text('Reference #:'),
              Text('96585465'),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.person),
              Text('Customer #:'),
              Text('Oliver Cromwell'),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.home),
              Text('Delivery Address #:'),
              Text('Nagtahan sampaloc blk 55 lot 3'),
            ],
          ),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
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
                        builder: (context) => const ReceiptScreen()));
              },
              child: const Text('OK'))
        ]));
  }
}
