// ignore_for_file: avoid_unnecessary_containers

import 'package:app/analytics/presentation/pages/analytics_page.dart';
import 'package:app/authentication/presentation/controller/authentication_controller.dart';
import 'package:app/authentication/presentation/pages/authenticated_widget.dart';
import 'package:app/authentication/presentation/pages/landing.dart';
import 'package:app/gawain/presentation/pages/gawain_layout.dart';
import 'package:app/home/presentation/pages/kagawa_home_page.dart';
import 'package:app/search/presentation/pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
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
            Scaffold(
                body: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        ref.read(isAuthenticated.notifier).state = false;
                        // ignore: use_build_context_synchronously
                      },
                      child: Text("Log Out"))
                ],
              ),
            ))
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
