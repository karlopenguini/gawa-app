// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app/profile/presentation/pages/kagawa_experience_edit.dart';
import 'package:app/profile/presentation/widgets/kagawa_calling_card.dart';
import 'package:app/profile/presentation/pages/kagawa_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/rendering.dart';

class KagawaProfilePage extends StatefulWidget {
  final int id;

  const KagawaProfilePage({
    super.key,
    required this.id,
  });

  @override
  State<KagawaProfilePage> createState() => _KagawaProfilePageState(id);
}

class _KagawaProfilePageState extends State<KagawaProfilePage> {
  final int id;
  _KagawaProfilePageState(this.id);

  final PageController _myPage = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isUserDragging = false;

  @override
  void initState() {
    super.initState();
    _myPage.addListener(() {
      if (_myPage.position.userScrollDirection != ScrollDirection.idle) {
        _isUserDragging = true;
      } else {
        _isUserDragging = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(32),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4),
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
                              backgroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 0
                                      ? theme.colorScheme.primary
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 0
                                      ? Colors.white
                                      : theme.colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Profile",
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
                                      ? theme.colorScheme.primary
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 1
                                      ? Colors.white
                                      : theme.colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Schedule",
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
                                      ? theme.colorScheme.primary
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 2
                                      ? Colors.white
                                      : theme.colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Reviews",
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
                        SizedBox(
                          width: 100,
                          height: 26,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0)),
                              backgroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 3
                                      ? theme.colorScheme.primary
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 3
                                      ? Colors.white
                                      : theme.colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Bookings",
                              style: TextStyle(fontSize: 14, letterSpacing: -1),
                              softWrap: false,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentPageIndex = 3;
                                _myPage.jumpToPage(3);
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
                              backgroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 4
                                      ? theme.colorScheme.primary
                                      : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  _currentPageIndex == 4
                                      ? Colors.white
                                      : theme.colorScheme.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Gallery",
                              style: TextStyle(fontSize: 14, letterSpacing: -1),
                              softWrap: false,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentPageIndex = 4;
                                _myPage.jumpToPage(4);
                              });
                            },
                          ),
                        ),
                      ],
                    )),
              )),
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          backgroundColor: Colors.transparent,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Dela Cruz",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  )),
              Row(
                children: [
                  Text("Plumbing",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          letterSpacing: -1)),
                  Icon(
                    Icons.circle,
                    color: Colors.black54,
                    size: 4,
                  ),
                  Text("Pipe Fitting",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          letterSpacing: -1))
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
              tooltip: 'Open chat of this kagawa',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KagawaProfileEdit()),
                );
              },
            ),
          ],
          foregroundColor: theme.colorScheme.primary,
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
              child: Column(
                children: [
                  KagawaCallingCard(
                    id: this.id,
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 24),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Experience",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      letterSpacing: -1.0)),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: theme.colorScheme.outline,
                                  onPressed: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const KagawaExperienceEdit()),
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Plumber",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1.0)),
                                  Text("Tubero Experts' Plumbing Services",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Aug 2023 - Present · 3 mos",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Calabarzon, Philippines",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Plumber",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1.0)),
                                  Text("A & D Plumbing and Electrical Services",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Aug 2021 - Aug 2022 · 1 year",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Calabarzon, Philippines",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 24),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                      color: Colors.white,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Licences & Certifications",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: -1.0)),
                          SizedBox(height: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Plumbing NC II",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1.0)),
                                  Text("TESDA Binan",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Aug 2023 - Aug 2026",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pipe Fitting NC II",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1.0)),
                                  Text("TESDA Binan",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                  Text("Aug 2021 - Aug 2022 · 1 year",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          letterSpacing: -1.0)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: SfCalendar(
                view: CalendarView.week,
                timeSlotViewSettings: TimeSlotViewSettings(
                    timeTextStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    dateFormat: 'd',
                    dayFormat: 'EEE',
                    timeIntervalHeight: 64,
                    allDayPanelColor: theme.colorScheme.secondary,
                    timeRulerSize: 64),
                cellBorderColor: Colors.black38,
                todayHighlightColor: theme.colorScheme.primary,
              ),
            ),
            SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 24),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Reviews",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    letterSpacing: -1.0)),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Color.fromARGB(255, 255, 209, 59),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("4.9",
                                      style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "(12 reviews)",
                                    style: TextStyle(
                                        letterSpacing: -1,
                                        fontSize: 12,
                                        color: Colors.black54),
                                  )
                                ]),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 13),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Karlo Palisoc",
                                    style: TextStyle(
                                      letterSpacing: -1,
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                                Text("Plumbing Service",
                                    style: TextStyle(
                                      letterSpacing: -1,
                                      color: Colors.black54,
                                      fontSize: 12,
                                    )),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 2,
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    Text("1 day ago",
                                        style: TextStyle(
                                          letterSpacing: -1,
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Text(
                                      "Amazing Service by Juan. Will book again :)",
                                      style: TextStyle(
                                        letterSpacing: -1,
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
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
                                        "https://pbs.twimg.com/media/E6j3U05XEAE_9Mm.jpg"),
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
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("4.9",
                                        style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "(12 reviews)",
                                      style: TextStyle(
                                          letterSpacing: -1,
                                          fontSize: 12,
                                          color: Colors.black54),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Icon(Icons.check_circle_outline_rounded,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("100 Gawa Transactions",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("Plumbing NC II Certified",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("Pipe Fitting NC II Certified",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("PESO Binan Accredited",
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
                                ],
                              )
                            ]),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 126,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        alignment: Alignment.center,
                                        backgroundColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 226, 242, 255)),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                theme.colorScheme.primary),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 12)),
                                        elevation: MaterialStateProperty.all(0),
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ))),
                                    onPressed: () {},
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.book,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Quick Book",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))
                                        ])),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 126,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        alignment: Alignment.center,
                                        backgroundColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 226, 242, 255)),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                theme.colorScheme.primary),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 12)),
                                        elevation: MaterialStateProperty.all(0),
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ))),
                                    onPressed: () {},
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Message",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))
                                        ])),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 24),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bookings History",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                letterSpacing: -1.0)),
                        SizedBox(height: 13),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.black12,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text("Today",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                ),
                                SizedBox(
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
                            Row(
                              children: const [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Plumbing Service",
                                        style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: -1,
                                            color: Colors.black)),
                                    Text("Gawa ID: 1234",
                                        style: TextStyle(
                                            fontSize: 12,
                                            letterSpacing: -1,
                                            color: Colors.black45)),
                                    Text("1 day ago",
                                        style: TextStyle(
                                            fontSize: 10,
                                            letterSpacing: -1,
                                            color: Colors.black26))
                                  ],
                                ),
                                Spacer(),
                                Text("PHP 500",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: -1.5,
                                        color: Colors.black)),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
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
                                        "https://pbs.twimg.com/media/E6j3U05XEAE_9Mm.jpg"),
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
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color.fromARGB(255, 255, 209, 59),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("4.9",
                                        style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "(12 reviews)",
                                      style: TextStyle(
                                          letterSpacing: -1,
                                          fontSize: 12,
                                          color: Colors.black54),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Icon(Icons.check_circle_outline_rounded,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("100 Gawa Transactions",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("Plumbing NC II Certified",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("Pipe Fitting NC II Certified",
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
                                    Icon(Icons.assignment_outlined,
                                        size: 14, color: Colors.black54),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("PESO Binan Accredited",
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
                                ],
                              )
                            ]),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 126,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        alignment: Alignment.center,
                                        backgroundColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 226, 242, 255)),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                theme.colorScheme.primary),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 12)),
                                        elevation: MaterialStateProperty.all(0),
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ))),
                                    onPressed: () {},
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.book,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Quick Book",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))
                                        ])),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 126,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        alignment: Alignment.center,
                                        backgroundColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 226, 242, 255)),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                theme.colorScheme.primary),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 12)),
                                        elevation: MaterialStateProperty.all(0),
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                        ))),
                                    onPressed: () {},
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Message",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))
                                        ])),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
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
                                          "https://pbs.twimg.com/media/E6j3U05XEAE_9Mm.jpg"),
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
                                    Row(children: [
                                      Icon(
                                        Icons.star,
                                        size: 18,
                                        color:
                                            Color.fromARGB(255, 255, 209, 59),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("4.9",
                                          style: TextStyle(
                                              fontSize: 14,
                                              letterSpacing: -1,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "(12 reviews)",
                                        style: TextStyle(
                                            letterSpacing: -1,
                                            fontSize: 12,
                                            color: Colors.black54),
                                      )
                                    ]),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(children: [
                                      Icon(Icons.check_circle_outline_rounded,
                                          size: 14, color: Colors.black54),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("100 Gawa Transactions",
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
                                      Icon(Icons.assignment_outlined,
                                          size: 14, color: Colors.black54),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("Plumbing NC II Certified",
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
                                      Icon(Icons.assignment_outlined,
                                          size: 14, color: Colors.black54),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("Pipe Fitting NC II Certified",
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
                                      Icon(Icons.assignment_outlined,
                                          size: 14, color: Colors.black54),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("PESO Binan Accredited",
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
                                  ],
                                )
                              ]),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 126,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          alignment: Alignment.center,
                                          backgroundColor: MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 226, 242, 255)),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  theme.colorScheme.primary),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 12)),
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ))),
                                      onPressed: () {},
                                      child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.book,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("Quick Book",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    letterSpacing: -1))
                                          ])),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 126,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          alignment: Alignment.center,
                                          backgroundColor: MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 226, 242, 255)),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  theme.colorScheme.primary),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 12)),
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ))),
                                      onPressed: () {},
                                      child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.chat_bubble,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("Message",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    letterSpacing: -1))
                                          ])),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: [
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                          Image.network("https://picsum.photos/250?image=9",
                              fit: BoxFit.cover),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
