// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            bottom: TabBar(
              onTap: null,
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              labelColor: Colors.white,
              indicatorColor: Colors.white70,
              unselectedLabelColor: Colors.white38,
              tabs: const [
                Tab(icon: Icon(Icons.person), text: 'Personal Info'),
                Tab(
                  icon: Icon(Icons.build),
                  text: 'Company Details',
                ),
                Tab(icon: Icon(Icons.security), text: 'Account Security'),
              ],
            ),
            title: const Text(
              'New Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First name most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last name most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Middle Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Middle name most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Mobile Number',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Mobile most not empty';
                            }

                            if (value.length < 11) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _tabController.animateTo(_selectedIndex += 1);
                                }
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Contact Number',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Contact number most not empty';
                            }

                            if (value.length < 11) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Company Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Company name most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Company Address',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address most not empty';
                            }

                            if (value.length < 15) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _tabController.animateTo(_selectedIndex += 1);
                                }
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'UserName',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm password most not empty';
                            }

                            if (value.length < 6) {
                              return 'Invalid lenght';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: 300,
                          child: OutlinedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // _tabController.animateTo(_selectedIndex += 1);
                                }

                                QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.loading,
                                        title: 'Loading',
                                        text: 'Register Account please wait...',
                                        barrierDismissible: false,
                                        autoCloseDuration: Duration(seconds: 2))
                                    .then((value) => QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.success,
                                          title: 'Success',
                                          text: 'Account Ready!!',
                                          barrierDismissible: false,
                                          showConfirmBtn: true,
                                          onConfirmBtnTap: () {
                                            print('>>>>>>>>>>>>>>>>>>>>>>>>');
                                            Navigator.of(context).pop();
                                          },
                                        ));
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
