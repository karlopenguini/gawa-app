import 'package:app/gawain_request/presentation/pages/gawain_request.dart';
import 'package:flutter/material.dart';

class KagawaCallingCard extends StatelessWidget {
  const KagawaCallingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the value for roundness
      ),
      margin: const EdgeInsets.all(13),
      elevation: 4,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    Icon(Icons.copy, size: 12, color: Colors.black54)
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
                    Icon(Icons.copy, size: 12, color: Colors.black54)
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
                    Icon(Icons.copy, size: 12, color: Colors.black54)
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
                                const Color.fromARGB(255, 226, 242, 255)),
                            foregroundColor:
                                MaterialStateProperty.all(theme.colorScheme.primary),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GawainRequestPage(),
                            ),
                          );
                        },
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
                                      fontSize: 16, letterSpacing: -1))
                            ])),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 126,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 226, 242, 255)),
                            foregroundColor:
                                MaterialStateProperty.all(theme.colorScheme.primary),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
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
                                      fontSize: 16, letterSpacing: -1))
                            ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
