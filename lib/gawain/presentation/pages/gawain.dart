import 'package:flutter/material.dart';

class Gawain extends StatelessWidget {
  const Gawain({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: theme.colorScheme.primary,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          backgroundColor: Colors.transparent,
          title: const Row(
            children: [
              CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTc7_4OYbZDUiOVmwBGM059t1mGTesSOiPiEU5Y9XLb-Rm8c2Cm")),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Juan Karlo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5,
                      )),
                  Text("Bidet Problem",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          letterSpacing: -1)),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gawain",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                        height: 240,
                        width: double.infinity,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://media-cdn.tripadvisor.com/media/photo-s/0f/80/38/b2/broken-sink.jpg",
                            )),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                          "Bidet keeps leaking from the valve. May need replacement valve",
                          style: TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Where",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      SizedBox(
                        height: 13,
                      ),
                      Text("Solen Residences, Don Jose, Santa Rosa, Laguna",
                          style: TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("When",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      SizedBox(
                        height: 13,
                      ),
                      Text("October 31 at 8:00 AM",
                          style: TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Duration Estimate",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      SizedBox(
                        height: 13,
                      ),
                      Text("Est. 2 - 3 hrs",
                          style: TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Budget",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      SizedBox(
                        height: 13,
                      ),
                      Text("Under 1,000",
                          style: TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Placeholder(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.red))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.red),
                          elevation: const MaterialStatePropertyAll(0),
                        ),
                        child: const Text("Decline")),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Placeholder(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.transparent))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          elevation: const MaterialStatePropertyAll(0),
                        ),
                        child: const Text("Create Offer")),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Placeholder(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: BorderSide(color: theme.colorScheme.primary))),
                          backgroundColor:
                              MaterialStatePropertyAll(theme.colorScheme.primary),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          elevation: const MaterialStatePropertyAll(0),
                        ),
                        child: const Text("Accept offer")),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
