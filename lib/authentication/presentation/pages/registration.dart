// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:app/authentication/presentation/controller/authentication_controller.dart';
import 'package:app/authentication/presentation/pages/success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StepRegistration(),
    );
  }
}

class StepRegistration extends ConsumerStatefulWidget {
  const StepRegistration({Key? key}) : super(key: key);

  @override
  _StepRegistrationState createState() => _StepRegistrationState();
}

class _StepRegistrationState extends ConsumerState<StepRegistration> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentStep = 0;
  bool _complete = false;
  List<GlobalKey<FormBuilderState>> _formKeys =
      List.generate(4, (index) => GlobalKey<FormBuilderState>());

  ConfirmationResult? _result;
  Map<String, dynamic> getAllFormValues() {
    Map<String, dynamic> formValues = {};

    for (int i = 0; i < _formKeys.length; i++) {
      var formKey = _formKeys[i];
      var currentState = formKey.currentState;

      if (currentState != null) {
        formValues['Step $i'] = {};

        // Iterate through fields in the current step
        currentState.fields.forEach((field, fieldState) {
          formValues['Step $i'][field] = fieldState.value;
        });
      }
    }

    return formValues;
  }

  void _goToStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  bool _validate() {
    final form = _formKeys[_currentStep].currentState;
    print(_formKeys[_currentStep].currentState);
    if (form != null && form.validate()) {
      return true;
    }
    return false;
  }

  void _nextStep() async {
    if (!_complete) {
      if (_currentStep + 1 <= 3 && _validate()) {
        _goToStep(_currentStep + 1);
      }
      if (_currentStep + 1 == 4) {
        setState(() {
          _complete = true;
        });
      }
    } else {
      await _startPhoneAuthentication();
    }
  }

  Future<void> _startPhoneAuthentication() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:
          "+63" + _formKeys[0].currentState!.fields['phone_number']!.value!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {}
      },
      codeSent: (String verificationId, int? resendToken) async {
        String? smsCode = await showOtpInputDialog();
        if (smsCode != null && smsCode.isNotEmpty) {
          try {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: smsCode,
            );

            // Sign in or link with the credential
            final res =
                await FirebaseAuth.instance.signInWithCredential(credential);

            // Show success Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Authentication successful'),
                duration: Duration(seconds: 2),
              ),
            );
            final data = getAllFormValues();
            await _firestore.collection('user').doc(res.user!.uid).set({
              'phone_number': res.user!.phoneNumber,
              'account_status': 'pending',
              'address_barangay': data['Step 3']['barangay'],
              'address_city': data['Step 3']['city'],
              'address_province': data['Step 3']['province'],
              'full_address': data['Step 3']['full_address'],
              'first_name': data['Step 1']['first_name'],
              'middle_name': data['Step 1']['middle_name'],
              'last_name': data['Step 1']['last_name'],
              'is_kagawa': false,
              'date_of_birth': data['Step 2']['date_of_birth'],
            });
            ref.read(isAuthenticated.notifier).state = true;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SuccessPage(),
              ),
            );
          } on FirebaseAuthException catch (e) {
            // Handle Firebase authentication errors
            print("Firebase Authentication Error: ${e.message}");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Authentication failed. Please try again.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          // Handle the case where the user did not enter a valid OTP
          print("Invalid OTP");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid OTP. Please try again.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

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

  void _cancel() {
    if (_currentStep > 0) {
      _goToStep(_currentStep - 1);
    }
  }

  List<Step> _stepList() {
    List<Step> steps = [
      _buildStep(
        title: 'Account Information',
        subtitle: 'Provide your contact details and verify your device',
        fields: ['phone_number'],
        formKeyIndex: 0,
        isNumeric: true,
      ),
      _buildStep(
        title: "Personal Details",
        subtitle: 'Let us know what to call you',
        fields: ['first_name', 'middle_name', 'last_name'],
        formKeyIndex: 1,
      ),
      _buildStep(
        title: 'Additional Personal Information',
        subtitle: 'Share more about yourself',
        fields: ['nationality', 'date_of_birth', 'place_of_birth'],
        formKeyIndex: 2,
        isDropdown: true,
      ),
      _buildStep(
        title: 'Address Details',
        subtitle: 'Tell us where to drop your #KaGawa',
        fields: [
          'province',
          'city',
          'barangay',
          'full_address',
        ],
        formKeyIndex: 3,
        isDropdown: true,
      ),
    ];

    return steps;
  }

  Step _buildStep({
    required String title,
    String subtitle = '',
    required List<String> fields,
    required int formKeyIndex,
    bool isNumeric = false,
    bool isDropdown = false,
  }) {
    return Step(
      isActive: _currentStep >= _stepIndex(title),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      content: FormBuilder(
        key: _formKeys[formKeyIndex],
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: fields.map((fieldName) {
              if (isDropdown) {
                // Assuming you have a method to get dropdown items
                List<String> dropdownItems = getDropdownItems(fieldName);
                return FormBuilderDropdown(
                  name: fieldName,
                  style: const TextStyle(fontSize: 24),
                  validator: FormBuilderValidators.required(),
                  decoration: InputDecoration(
                    labelText: fieldName.split('_').join(' ').capitalize(),
                    labelStyle: const TextStyle(color: Colors.blue),
                  ),
                  items: dropdownItems
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                );
              } else {
                return FormBuilderTextField(
                  keyboardType:
                      isNumeric ? TextInputType.number : TextInputType.text,
                  name: fieldName,
                  style: const TextStyle(fontSize: 24),
                  validator: FormBuilderValidators.required(),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    labelText: fieldName.split('_').join(' ').capitalize(),
                    labelStyle: const TextStyle(color: Colors.blue),
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }

  int _stepIndex(String title) {
    switch (title) {
      case 'Account Information':
        return 0;
      case 'Personal Details':
        return 1;
      case 'Additional Personal Information':
        return 2;
      case 'Address Details':
        return 3;
      default:
        return 0;
    }
  }

  // Mock method to get dropdown items
  List<String> getDropdownItems(String fieldName) {
    // Implement logic to get dropdown items based on the field name
    return ['Item 1', 'Item 2', 'Item 3'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        onStepContinue: _nextStep,
        currentStep: _currentStep,
        onStepCancel: _cancel,
        steps: _stepList(),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
