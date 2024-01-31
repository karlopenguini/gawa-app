import 'package:app/gawain/presentation/pages/gawain.dart';
import 'package:flutter/material.dart';

class GawainPage extends StatefulWidget {
  const GawainPage({super.key});

  @override
  State<GawainPage> createState() => _GawainPageState();
}

class _GawainPageState extends State<GawainPage> {
  final PageController _myPage = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isUserDragging = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          centerTitle: true,
          title: const Image(
            image: AssetImage('assets/gawa_text_white.png'),
            height: 32,
          ),
          backgroundColor: theme.colorScheme.primary,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(32),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  child: Row(children: [
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0)),
                          backgroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 0
                                  ? Colors.white
                                  : Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 0
                                  ? theme.colorScheme.primary
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Requests",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 0;
                            _myPage.jumpToPage(0);
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0)),
                          backgroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 1
                                  ? Colors.white
                                  : Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 1
                                  ? theme.colorScheme.primary
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Negotiate",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 1;
                            _myPage.jumpToPage(1);
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0)),
                          backgroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 2
                                  ? Colors.white
                                  : Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(
                              _currentPageIndex == 2
                                  ? theme.colorScheme.primary
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Booked",
                          style: TextStyle(fontSize: 14, letterSpacing: -1),
                          softWrap: false,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 2;
                            _myPage.jumpToPage(2);
                          });
                        },
                      ),
                    ),
                  ]))),
        ),
        body: PageView(
          controller: _myPage,
          onPageChanged: (int page) {
            if (_isUserDragging) {
              var swipingRight = page > _myPage.page!.round();
              if (swipingRight) {
                setState(() {
                  _currentPageIndex = _currentPageIndex + 1;
                });
              } else {
                setState(() {
                  _currentPageIndex = _currentPageIndex - 1;
                });
              }
              print(_currentPageIndex);
            }
          },
          children: [
            SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text("Today (3)",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black12,
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Adjust the value for roundness
                  ),
                  margin: const EdgeInsets.all(13),
                  elevation: 4,
                  shadowColor: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTc7_4OYbZDUiOVmwBGM059t1mGTesSOiPiEU5Y9XLb-Rm8c2Cm"),
                                    radius: 40,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("Juan D.C.",
                                      style: TextStyle(
                                          letterSpacing: -1,
                                          fontSize: 14,
                                          color: Colors.black54))
                                ],
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bidet Problem"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Icon(Icons.check_circle_outline_rounded,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("#KaSuki",
                                        style: TextStyle(
                                          letterSpacing: -1,
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ))
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Icon(Icons.schedule,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("8:00 AM",
                                        style: TextStyle(
                                          letterSpacing: -1,
                                          color: Colors.black54,
                                          fontSize: 12,
                                        )),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(Icons.copy,
                                        size: 12, color: Colors.black54)
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Icon(Icons.location_on_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "B3, L21, P1, Solen Residences, Don Jose, Sta Rosa, Laguna",
                                      style: TextStyle(
                                          letterSpacing: -1,
                                          color: Colors.black54,
                                          fontSize: 12,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(Icons.copy,
                                        size: 12, color: Colors.black54)
                                  ]),
                                ],
                              )
                            ]),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: 126,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Gawain(),
                                    ),
                                  );
                                },
                                child: const Text("View Gawa",
                                    style: const TextStyle(
                                        fontSize: 16, letterSpacing: -1))),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
