import 'package:app/authentication/presentation/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String phoneNumber = "+639299716239";
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              const Center(
                  child: Image(image: AssetImage("assets/big_logo.png"))),
              const SizedBox(height: 48),
              FormBuilderTextField(
                name: 'phone_number',
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.blue)),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.blue)),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              TextButton(
                child: const Text("Forgot your password?"),
                onPressed: () {},
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {
                            print('The provided phone number is not valid.');
                          }
                        },
                        codeSent:
                            (String verificationId, int? resendToken) async {},
                        timeout: const Duration(seconds: 60),
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    style: const ButtonStyle(),
                    child: const Text("Log in")),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.blue),
                      elevation: const MaterialStatePropertyAll(0),
                    ),
                    child: const Text("Register")),
              ),
              const Spacer(),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ));
  }
}
