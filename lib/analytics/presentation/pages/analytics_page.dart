import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPage();
}

class _AnalyticsPage extends State<AnalyticsPage> {
  final PageController _myPage = PageController(initialPage: 0);
  final List<String> entries = <String>['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 173,
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 135, 249),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              color: Colors.transparent),
                          Image(
                            image: AssetImage('assets/gawa_text_white.png'),
                            height: 32,
                          ),
                          Icon(Icons.chat_bubble_rounded,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Earnings",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                Text("₱ 1,000.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        height: 1.5,
                                        color: Colors.white))
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        999.0), // Adjust the value for roundness
                                  ))),
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_outward_rounded,
                                      color: Colors.blue),
                                  Text("Transfer",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          letterSpacing: -1))
                                ],
                              ),
                            ),
                          ],
                        ))
                  ]),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(13),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        child: const Text(
                          "Earnings",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        child: const Text(
                          "Services",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        child: const Text(
                          "Customers",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        child: const Text(
                          "Operations",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        child: const Text(
                          "Account",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
