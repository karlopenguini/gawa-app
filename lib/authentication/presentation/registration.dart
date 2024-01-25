// ignore_for_file: library_private_types_in_public_api

import 'package:app/authentication/data/authentication_repository.dart';
import 'package:app/authentication/presentation/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StepRegistration(),
    );
  }
}

class StepRegistration extends ConsumerStatefulWidget {
  const StepRegistration({super.key});

  @override
  _StepRegistrationState createState() => _StepRegistrationState();
}

class _StepRegistrationState extends ConsumerState<StepRegistration> {
  int _index = 0;
  final ScrollController _scrollController = ScrollController();
  void _scrollToStep(int index) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        index * MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  final phoneAuthStepNumber = 0;
  final otpVerifyStepNumber = 1;
  final _formKey = GlobalKey<FormState>();
  final _otpFieldKey = GlobalKey<FormBuilderFieldState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
            _scrollToStep(_index);
          }
        },
        onStepContinue: () async {
          if (_index == phoneAuthStepNumber) {
            var authRepo = ref.read(authenticationRepositoryProvider);
            authRepo.signIn("+639299716239");
          }
          if (_index == otpVerifyStepNumber) {
            var authRepo = ref.read(authenticationRepositoryProvider);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(await authRepo.verifyOTP(ref.read(verificationId),
                      _otpFieldKey.currentState?.value)
                  ? "Success"
                  : "Fail"),
            ));
          }

          if (_index >= 0) {
            setState(() {
              _index += 1;
            });
            _scrollToStep(_index);
          }
          if (_index >= 6) {
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SuccessPage();
                },
              ),
              (_) => false,
            );
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
          _scrollToStep(_index);
        },
        steps: <Step>[
          Step(
            isActive: _index >= 0,
            title: const Text('Fill in Account Details', style: TextStyle()),
            subtitle: const Text(
                "We will use this to contact you and to verify your device ",
                style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                FormBuilderTextField(
                  name: 'phone_number',
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ]),
            ),
          ),
          Step(
            isActive: _index >= 1,
            title: const Text('Authenticate Phone Number'),
            subtitle: const Text('You will receive an OTP from your phone',
                style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                FormBuilderTextField(
                  key: _otpFieldKey,
                  name: 'sms_otp',
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      labelText: 'SMS OTP',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ]),
            ),
          ),
          Step(
            isActive: _index >= 2,
            title: const Text("What's your name?"),
            subtitle: const Text('We want to know what to call you',
                style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                FormBuilderTextField(
                  name: 'first_name',
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
                FormBuilderTextField(
                  name: 'middle_name',
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      labelText: 'Middle Name',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
                FormBuilderTextField(
                  name: 'last_name',
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
              ]),
            ),
          ),
          Step(
            isActive: _index >= 3,
            title: const Text("Emergency Contact"),
            subtitle: const Text('', style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'emergency_contact_name',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'emergency_contact_phone',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'emergency_contact_email',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'E-mail (optional)',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: _index >= 4,
            title: const Text("Tell us more about yourself"),
            subtitle: const Text(
                'Please provide the following personal information',
                style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'nationality',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Nationality',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'date_of_birth',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'place_of_birth',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Place of Birth',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: _index >= 5,
            title: const Text("Tell us where we can drop your #KaGawa"),
            subtitle: const Text(
                'Please provide the following personal information',
                style: TextStyle(color: Colors.black38)),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'country',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'province',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Province',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'city',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'City',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'barangay',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Barangay',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'full_address',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Block, Lot, Street Name',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  FormBuilderTextField(
                    name: 'zipcode',
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                        labelText: 'Zip Code',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
