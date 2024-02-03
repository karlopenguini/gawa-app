import 'package:app/gawain/presentation/pages/gawain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GawainPage extends StatefulWidget {
  const GawainPage({super.key});

  @override
  State<GawainPage> createState() => _GawainPageState();
}

class _GawainPageState extends State<GawainPage> {
  final PageController _myPage = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  bool _isUserDragging = false;

  Stream<QuerySnapshot> getPendingRequests() {
    // Replace 'your_collection' with your actual collection name
    return FirebaseFirestore.instance
        .collection('gawa')
        .where('user',
            isEqualTo: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid))
        .where('status', isEqualTo: 'pending')
        .snapshots();
  }

  Stream<QuerySnapshot> getBookedRequests() {
    // Replace 'your_collection' with your actual collection name
    return FirebaseFirestore.instance
        .collection('gawa')
        .where('user',
            isEqualTo: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid))
        .where('status', isEqualTo: 'booked')
        .snapshots();
  }

  Stream<QuerySnapshot> getFinishedRequests() {
    // Replace 'your_collection' with your actual collection name
    return FirebaseFirestore.instance
        .collection('gawa')
        .where('user',
            isEqualTo: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid))
        .where('status', isEqualTo: 'finished')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Image(
            image: AssetImage('assets/gawa_text_white.png'),
            height: 32,
          ),
          backgroundColor: theme.colorScheme.primary,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
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
                          "Pending",
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
                          "Booked",
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
                          "Finished",
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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: getPendingRequests(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    debugPrint(documents.length.toString());
                    var x = ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;
                          debugPrint(data.toString());

                          return Card(
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
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Column(
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
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Bidet Problem"),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Row(children: [
                                                Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    size: 14,
                                                    color: Colors.black54),
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
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(children: [
                                                const Icon(Icons.schedule,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                    DateFormat.MMMEd()
                                                        .add_jm()
                                                        .format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                data['schedule']
                                                                        .seconds *
                                                                    1000)),
                                                    style: const TextStyle(
                                                      letterSpacing: -1,
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    )),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                              ]),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Wrap(children: [
                                                const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    data['location'],
                                                    style: const TextStyle(
                                                        letterSpacing: -1,
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Icon(Icons.copy,
                                                    size: 12,
                                                    color: Colors.black54)
                                              ]),
                                            ],
                                          ),
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SizedBox(
                                      width: 126,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Gawain(
                                                    id: documents[index].id,
                                                    budget: data['budget'],
                                                    description:
                                                        data['description'],
                                                    estimatedSize:
                                                        data['estimatedSize'],
                                                    kagawa: data['kagawa'],
                                                    location: data['location'],
                                                    schedule: data['schedule'],
                                                    status: data['status'],
                                                    user: data['user']),
                                              ),
                                            );
                                          },
                                          child: const Text("View Gawa",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });

                    return x;
                  }
                }),
            StreamBuilder<QuerySnapshot>(
                stream: getBookedRequests(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    debugPrint(documents.length.toString());
                    var x = ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;
                          debugPrint(data.toString());

                          return Card(
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
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Column(
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
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Bidet Problem"),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Row(children: [
                                                Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    size: 14,
                                                    color: Colors.black54),
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
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(children: [
                                                const Icon(Icons.schedule,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                    DateFormat.MMMEd()
                                                        .add_jm()
                                                        .format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                data['schedule']
                                                                        .seconds *
                                                                    1000)),
                                                    style: const TextStyle(
                                                      letterSpacing: -1,
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    )),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                              ]),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Wrap(children: [
                                                const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    data['location'],
                                                    style: const TextStyle(
                                                        letterSpacing: -1,
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Icon(Icons.copy,
                                                    size: 12,
                                                    color: Colors.black54)
                                              ]),
                                            ],
                                          ),
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SizedBox(
                                      width: 126,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Gawain(
                                                    id: documents[index].id,
                                                    budget: data['budget'],
                                                    description:
                                                        data['description'],
                                                    estimatedSize:
                                                        data['estimatedSize'],
                                                    kagawa: data['kagawa'],
                                                    location: data['location'],
                                                    schedule: data['schedule'],
                                                    status: data['status'],
                                                    user: data['user']),
                                              ),
                                            );
                                          },
                                          child: const Text("View Gawa",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });

                    return x;
                  }
                }),
            StreamBuilder<QuerySnapshot>(
                stream: getFinishedRequests(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    debugPrint(documents.length.toString());
                    var x = ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;
                          debugPrint(data.toString());

                          return Card(
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
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Column(
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
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Bidet Problem"),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Row(children: [
                                                Icon(
                                                    Icons
                                                        .check_circle_outline_rounded,
                                                    size: 14,
                                                    color: Colors.black54),
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
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(children: [
                                                const Icon(Icons.schedule,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                    DateFormat.MMMEd()
                                                        .add_jm()
                                                        .format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                data['schedule']
                                                                        .seconds *
                                                                    1000)),
                                                    style: const TextStyle(
                                                      letterSpacing: -1,
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    )),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                              ]),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Wrap(children: [
                                                const Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: Colors.black54),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    data['location'],
                                                    style: const TextStyle(
                                                        letterSpacing: -1,
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Icon(Icons.copy,
                                                    size: 12,
                                                    color: Colors.black54)
                                              ]),
                                            ],
                                          ),
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SizedBox(
                                      width: 126,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Gawain(
                                                    id: documents[index].id,
                                                    budget: data['budget'],
                                                    description:
                                                        data['description'],
                                                    estimatedSize:
                                                        data['estimatedSize'],
                                                    kagawa: data['kagawa'],
                                                    location: data['location'],
                                                    schedule: data['schedule'],
                                                    status: data['status'],
                                                    user: data['user']),
                                              ),
                                            );
                                          },
                                          child: const Text("View Gawa",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: -1))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });

                    return x;
                  }
                }),
          ],
        ));
  }
}
