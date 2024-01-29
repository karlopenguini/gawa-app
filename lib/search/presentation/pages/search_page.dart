import 'package:app/home/presentation/pages/home_page.dart';
import 'package:app/profile/presentation/pages/kagawa_profile_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(13, 32, 13, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2)),
                Text("Blk 3, Lot 21, Solen Residences",
                    style: TextStyle(
                        fontSize: 12, color: Colors.blue, letterSpacing: 0.8))
              ],
            )
          ],
        ),
        const DropdownButtonExample(),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KagawaProfilePage(id: 0),
                ),
              );
            },
            child: const Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/media/E6j3U05XEAE_9Mm.jpg'),
                        radius: 40,
                      ),
                      SizedBox(
                          // height: 4,
                          ),
                      Text("Juan D.C.",
                          style: TextStyle(
                              letterSpacing: -1,
                              fontSize: 14,
                              color: Colors.black54))
                    ],
                  ),
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
              ),
            ))
      ]),
    ));
  }
}

const List<String> list = <String>['Car Wash', 'Home Maintenance', 'Plumbing'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 24,
      style: const TextStyle(color: Colors.black87),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
