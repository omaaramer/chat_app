// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/regester_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snakbar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_buttun.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPraimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(height: 75),
                Image.asset(
                  kLogo,
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'StU Chat',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: "Pacifico",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  label: 'Username',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  obscureText: true,
                  label: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 10),
                CustomButtun(
                    text: 'LOGIN',
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await userLogin();
                          // customShowSnalBar(context, 'success');
                          Navigator.pushNamed(context, ChatScreen.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // print('No user found for that email.');
                            customShowSnalBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            // print('Wrong password provided for that user.');
                            customShowSnalBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          customShowSnalBar(
                              context, 'there was an error, try  again');
                          log("===========the catch error ========$e");
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an acount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          '  Regester',
                          style: TextStyle(
                            color: Color(0xffd1f2f3),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
