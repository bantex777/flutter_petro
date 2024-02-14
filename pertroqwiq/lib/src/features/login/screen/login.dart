// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'dart:io';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pertroqwiq/src/features/home/screen/home.dart';
import 'package:pertroqwiq/src/features/login/features/posts/bloc/login_bloc.dart';
import 'package:pertroqwiq/src/features/login/features/posts/bloc/login_event.dart';
import 'package:pertroqwiq/src/features/login/features/posts/bloc/login_state.dart';
import 'package:pertroqwiq/src/features/login/screen/signup.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc loginBloc = LoginBloc(LogInBlocInitialState());

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: DropShadowImage(
                    offset: Offset(3, 4),
                    scale: 1,
                    blurRadius: 6,
                    borderRadius: 20,
                    image: Image.asset(
                      'assets/logo.png',
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  constraints:
                                      BoxConstraints(minWidth: double.infinity),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(22.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  'Login',
                                                  style: GoogleFonts.archivo(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 14,
                                                ),
                                                TextField(
                                                  controller: emailController,
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        UnderlineInputBorder(),
                                                    labelText:
                                                        'Enter your username',
                                                  ),
                                                  style: GoogleFonts.archivo(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                                SizedBox(
                                                  height: 26,
                                                ),
                                                TextField(
                                                  controller:
                                                      passwordController,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  obscureText: _obscured,
                                                  focusNode: textFieldFocusNode,
                                                  decoration: InputDecoration(
                                                    //Hides label on focus or if filled
                                                    labelText: "Password",
                                                    // Reduces height a bit
                                                    border:
                                                        UnderlineInputBorder(),
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 4, 0),
                                                      child: GestureDetector(
                                                        onTap: _toggleObscured,
                                                        child: Icon(
                                                          _obscured
                                                              ? Icons
                                                                  .visibility_rounded
                                                              : Icons
                                                                  .visibility_off_rounded,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 26,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: OutlinedButton(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Login',
                                                            style: GoogleFonts
                                                                .archivo(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          BlocConsumer(
                                                              bloc: loginBloc,
                                                              builder: (context,
                                                                  state) {
                                                                return Row();
                                                              },
                                                              listener:
                                                                  (context,
                                                                      state) {
                                                                print(state);
                                                                if (state
                                                                    is LogInBlocState) {
                                                                  if (state
                                                                          .loginResponse
                                                                          .clientName !=
                                                                      null) {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const HomeScreen()),
                                                                    );
                                                                  } else {
                                                                    toastification
                                                                        .show(
                                                                      context:
                                                                          context,
                                                                      type: ToastificationType
                                                                          .error,
                                                                      title: Text(
                                                                          'Incorrect Email or Password'),
                                                                      autoCloseDuration:
                                                                          const Duration(
                                                                              seconds: 3),
                                                                    );
                                                                  }
                                                                }
                                                              })
                                                        ],
                                                      ),
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                255, 15, 15),
                                                      ),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           const HomeScreen()),
                                                        // );
                                                        loginBloc.add(LoginEvent(
                                                            x_name:
                                                                emailController
                                                                    .text,
                                                            x_pass:
                                                                passwordController
                                                                    .text));
                                                      }),
                                                ),
                                                SizedBox(
                                                  height: 14,
                                                ),
                                                Center(
                                                  child: Text(
                                                    'Forgot your password?',
                                                    style: GoogleFonts.archivo(
                                                        color: Color.fromARGB(
                                                            195, 140, 140, 140),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 2,
                                            thickness: 1,
                                            color: Color.fromARGB(98, 0, 0, 0),
                                          ),
                                          SizedBox(
                                            height: 26,
                                          ),
                                          Center(
                                            child: Text(
                                              'CONTINUE AS GUEST',
                                              style: GoogleFonts.archivo(
                                                  color: Color.fromARGB(
                                                      230, 28, 28, 28),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.archivo(
                                    fontSize: 16, color: Colors.white),
                              ))),
                      const SizedBox(
                        height: 2,
                      ),
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
