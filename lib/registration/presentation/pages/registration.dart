import 'package:app/registration/presentation/pages/success.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StepRegistration(),
    );
  }
}

class StepRegistration extends StatefulWidget {
  const StepRegistration({super.key});

  @override
  State<StepRegistration> createState() => _StepRegistrationState();
}

class _StepRegistrationState extends State<StepRegistration> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
        if (_index >= 5) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SuccessPage(),
            ),
          );
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
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
            child: const Text('Content for Step 1'),
          ),
        ),
        Step(
          isActive: _index >= 1,
          title: const Text('Authenticate Phone Number'),
          subtitle: const Text('You will receive an OTP from your phone',
              style: TextStyle(color: Colors.black38)),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1r'),
          ),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text("What's your name?"),
          subtitle: const Text('We want to know what to call you',
              style: TextStyle(color: Colors.black38)),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1r'),
          ),
        ),
        Step(
          isActive: _index >= 3,
          title: const Text("Emergency Contact"),
          subtitle: const Text('', style: TextStyle(color: Colors.black38)),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1r'),
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
            child: const Text('Content for Step 1r'),
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
            child: const Text('Content for Step 1r'),
          ),
        ),
      ],
    );
  }
}
