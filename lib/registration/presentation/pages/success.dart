import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 1));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerCenterLeft.play();
    _controllerCenterRight.play();
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "We'll take it from",
                    children: [
                      TextSpan(
                          text: " here", style: TextStyle(color: Colors.yellow))
                    ],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        letterSpacing: -1.8),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Your account is currently under review. Once verified, you'll be a certified #KaGawa! \n\n To view the status of your submission, please head over to your profile and check status.\n\n Verification is typically done within one day!",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConfettiWidget(
                      confettiController: _controllerCenterRight,
                      blastDirection: 0, // radial value - RIGHT
                      emissionFrequency: 0.6,
                      minimumSize: const Size(10,
                          10), // set the minimum potential size for the confetti (width, height)
                      maximumSize: const Size(50,
                          50), // set the maximum potential size for the confetti (width, height)
                      numberOfParticles: 1,
                      gravity: 0.1,
                    ),
                  ),
                  const Spacer(),
                  const Row(children: [
                    Text("Ipa",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w900)),
                    Image(image: AssetImage("assets/gawa-white.png")),
                    Text("na natin to!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w900)),
                  ]),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConfettiWidget(
                      confettiController: _controllerCenterLeft,
                      blastDirection: 3, // radial value - RIGHT
                      emissionFrequency: 0.6,
                      minimumSize: const Size(10,
                          10), // set the minimum potential size for the confetti (width, height)
                      maximumSize: const Size(50,
                          50), // set the maximum potential size for the confetti (width, height)
                      numberOfParticles: 1,
                      gravity: 0.1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999.0),
                        ))),
                    child: const Text("View Status",
                        style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999.0),
                        ))),
                    child: const Text(
                      "Back Home",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ));
  }
}
