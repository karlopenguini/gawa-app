import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Colors.black45),
            elevation: MaterialStateProperty.all(14),
            foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 107, 114, 128)),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(64)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side:
                        BorderSide(color: Color.fromARGB(255, 209, 213, 219)))),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 249, 250, 251))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
        child: Row(children: [
          const Icon(Icons.search),
          Container(
            width: 4.5,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'carwash',
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
                cursor: "",
                speed: const Duration(milliseconds: 120),
              ),
              TypewriterAnimatedText(
                'home cleaning',
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
                cursor: "",
                speed: const Duration(milliseconds: 120),
              ),
              TypewriterAnimatedText(
                'pipe fix',
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
                cursor: "",
                speed: const Duration(milliseconds: 120),
              ),
              TypewriterAnimatedText(
                'plumbing',
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                ),
                cursor: "",
                speed: const Duration(milliseconds: 120),
              ),
            ],
            totalRepeatCount: 9999,
            pause: const Duration(milliseconds: 2000),
            displayFullTextOnTap: false,
            stopPauseOnTap: true,
          )
        ]),
      ),
    );
  }
}
