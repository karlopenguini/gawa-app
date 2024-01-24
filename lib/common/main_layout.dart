// ignore_for_file: avoid_unnecessary_containers

import 'package:app/analytics/presentation/pages/analytics_page.dart';
import 'package:app/authentication/presentation/authenticated_widget.dart';
import 'package:app/gawain/presentation/pages/gawain_layout.dart';
import 'package:app/home/presentation/pages/home_page.dart';
import 'package:app/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var pages = [
    const HomePage(),
    const GawainPage(),
    const HomePage(),
    const SearchPage(),
  ];
  final PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return AuthenticatedWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
          child: const Icon(Icons.book), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          controller: _myPage,
          children: <Widget>[
            const HomePage(),
            const GawainPage(),
            const AnalyticsPage(),
            Center(
              child: Container(
                child: const Text('Empty Body 3'),
              ),
            )
          ],
          // physics:
          //     NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
        ),
        bottomNavigationBar: BottomAppBar(
            notchMargin: 5,
            shape: const CircularNotchedRectangle(),
            child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.home,
                          color: Color.fromARGB(255, 107, 114, 128)),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      },
                    ),
                    const Spacer(flex: 1),
                    IconButton(
                      icon: const Icon(Icons.bookmark,
                          color: Color.fromARGB(255, 107, 114, 128)),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(1);
                        });
                      },
                    ),
                    const Spacer(flex: 4),
                    IconButton(
                      icon: const Icon(Icons.area_chart_sharp,
                          color: Color.fromARGB(255, 107, 114, 128)),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(2);
                        });
                      },
                    ),
                    const Spacer(flex: 1),
                    IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 107, 114, 128),
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(3);
                        });
                      },
                    ),
                  ],
                ))),
      ),
    );
  }
}
