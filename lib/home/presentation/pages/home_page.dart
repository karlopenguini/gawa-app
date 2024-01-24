import 'package:app/home/presentation/widgets/search_button.dart';
import 'package:app/profile/presentation/pages/kagawa_profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Container(
              height: 154,
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
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Home",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2)),
                              Text("Blk 3, Lot 21, Solen Residences",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      letterSpacing: 0.8))
                            ],
                          )
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(13, 0, 13, 32),
                    child: SearchButton(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "My #Kagawa",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 135, 249),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: -1.5),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        KagawaCard(
                          role: "Plumbing",
                          name: "Juan Dela Cruz",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

class KagawaCard extends StatelessWidget {
  final String role;
  final String name;
  const KagawaCard({
    super.key,
    required this.role,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KagawaProfilePage(),
          ),
        );
      },
      child: Card(
        elevation: 1.6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/media/E6j3U05XEAE_9Mm.jpg"),
              ),
              const SizedBox(height: 10),
              Text(role,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.7,
                      fontSize: 16)),
              Text(name,
                  style: const TextStyle(
                      letterSpacing: -0.7, color: Colors.black54, fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
