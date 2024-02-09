import 'package:app/home/presentation/widgets/search_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/home/presentation/widgets/gawain_card.dart';

class KagawaHomePage extends StatelessWidget {
  const KagawaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // something to fetch the first 5 recent workers or something.
    var favorites = <GawainCard>[
      GawainCard(
        id: 0,
        suki: true,
        title: 'Bidet problem',
        name: 'Karlo',
        location: 'B3, L21, P1, Solen Residences, Don Jose, Sta Rosa, Laguna',
        time: DateTime.now(),
        image: 'https://cdn3.emoji.gg/emojis/8410-joshhutchersonwhistle.png',
      ),
      GawainCard(
        id: 1,
        suki: true,
        title: 'Bidet problem',
        name: 'Karlo',
        location: 'B3, L21, P1, Solen Residences, Don Jose, Sta Rosa, Laguna',
        time: DateTime.now(),
        image:
            'https://images.crunchbase.com/image/upload/c_pad,h_256,w_256,f_auto,q_auto:eco,dpr_1/t4x5rwsxoi2skbz2z95c',
      ),
      GawainCard(
        id: 2,
        title: 'Bidet problem',
        name: 'Karlo',
        location: 'B3, L21, P1, Solen Residences, Don Jose, Sta Rosa, Laguna',
        time: DateTime.now(),
      ),
    ];

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SafeArea(child: HomeBar()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gawain for today ",
                        style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            letterSpacing: -1.5),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 10),
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          for (var fav in favorites) fav,
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pending Requests",
                        style: TextStyle(
                            color: theme.colorScheme.outline,
                            fontSize: 20,
                            letterSpacing: -1.5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AlertCard(theme: theme),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Pending Requests",
                        style: TextStyle(
                            color: theme.colorScheme.outline,
                            fontSize: 20,
                            letterSpacing: -1.5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AlertCard(
                        theme: theme,
                        tertiary: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    required this.theme,
    this.tertiary = false,
  });

  final ThemeData theme;
  final bool tertiary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          color:
              tertiary ? theme.colorScheme.tertiary : theme.colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                  child: Icon(Icons.assignment_late,
                      color: theme.colorScheme.onPrimary, size: 55),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have 2 unread messages',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.onPrimary),
                      ),
                      Text(
                        'Message them ASAP to follow up with their concern',
                        style: TextStyle(
                            color: theme.colorScheme.onInverseSurface,
                            fontWeight: FontWeight.w100,
                            fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class PatronCard extends StatelessWidget {
  const PatronCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: NetworkImage(
                    'https://th.bing.com/th?id=OIP.uNuoQWv-ihzZIKjWvhCYfAHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Carwash',
                  style: TextStyle(
                      color: theme.colorScheme.onInverseSurface,
                      fontWeight: FontWeight.normal,
                      letterSpacing: -1.5),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Juan Dela Cruz Carwash',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: theme.colorScheme.onInverseSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      letterSpacing: -1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(children: [
      Container(
        height: 134,
        width: double.infinity,
        color: theme.colorScheme.primary,
      ),
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.transparent),
                  Image(
                    image: AssetImage('assets/gawa_text_white.png'),
                    height: 50,
                  ),
                  Icon(Icons.chat_bubble_rounded,
                      color: Colors.white, size: 18),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "kamusta, ",
                      style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 27,
                          shadows: [
                            Shadow(
                              offset: Offset(4, 4),
                              color: theme.colorScheme.tertiary,
                            )
                          ]),
                    ),
                    Text(
                      "John!",
                      style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          shadows: [
                            Shadow(
                              offset: Offset(4, 4),
                              color: theme.colorScheme.tertiary,
                            )
                          ]),
                    ) //(FirebaseAuth.instance.currentUser!).displayName!
                  ],
                )),
          ],
        ),
      ),
    ]);
  }
}
