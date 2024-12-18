import 'package:app/authentication/presentation/controller/authentication_controller.dart';
import 'package:app/authentication/presentation/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends ConsumerWidget {
  LandingPage({super.key});

  final _phoneKey = GlobalKey<FormBuilderFieldState>();
  final _passKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final Widget bigLogo = SvgPicture.asset('assets/Gawa_Logo_Small.svg',
        semanticsLabel: 'Gawa Logo',
        colorFilter:
            ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
        fit: BoxFit.contain);

    Future<String?> showOtpInputDialog() async {
      TextEditingController otpController = TextEditingController();

      return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enter OTP'),
            content: TextFormField(
              controller: otpController,
              keyboardType: TextInputType.number,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(otpController.text);
                },
                child: const Text('Submit'),
              ),
            ],
          );
        },
      );
    }

    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(height: 300, child: Center(child: bigLogo)),
              const SizedBox(height: 48),
              FormBuilderTextField(
                key: _phoneKey,
                name: 'phone_number',
                cursorColor: theme.colorScheme.primary,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: theme.colorScheme.primary)),
                obscureText: false,
              ),
              const SizedBox(height: 16),
              // FormBuilderTextField(
              //   key: _passKey,
              //   name: 'password',
              //   cursorColor: theme.colorScheme.primary,
              //   decoration: InputDecoration(
              //       labelText: 'Password',
              //       labelStyle: TextStyle(color: theme.colorScheme.primary)),
              //   obscureText: true,
              // ),
              const SizedBox(height: 32),
              // TextButton(
              //   child: const Text("Forgot your password?"),
              //   onPressed: () {},
              // ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber:
                            ("+63" + _phoneKey.currentState?.value).trim(),
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {}
                        },
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          String? smsCode = await showOtpInputDialog();
                          if (smsCode != null && smsCode.isNotEmpty) {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode,
                              );

                              // Sign in or link with the credential
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);

                              // Show success Snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Authentication successful'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              ref.read(isAuthenticated.notifier).state = true;
                            } on FirebaseAuthException catch (e) {
                              // Handle Firebase authentication errors
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Authentication failed. Please try again.'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          } else {
                            // Handle the case where the user did not enter a valid OTP
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid OTP. Please try again.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
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
                          RoundedRectangleBorder(
                              side: BorderSide(
                                  color: theme.colorScheme.primary))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      foregroundColor:
                          MaterialStatePropertyAll(theme.colorScheme.primary),
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
