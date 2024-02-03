import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Gawain extends StatelessWidget {
  final budget;
  final id;
  final description;
  final estimatedSize;
  final location;
  final schedule;
  final status;
  final user;
  final kagawa;
  const Gawain(
      {super.key,
      this.id,
      this.budget,
      this.description,
      this.estimatedSize,
      this.location,
      this.schedule,
      this.status,
      this.user,
      this.kagawa});

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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Gawain",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(description,
                          style:
                              const TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Where",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(location,
                          style:
                              const TextStyle(fontSize: 16, letterSpacing: -1))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("When",
                          style: TextStyle(fontSize: 20, letterSpacing: -1)),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                          DateFormat.MMMEd().add_jm().format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  schedule.seconds * 1000)),
                          style:
                              const TextStyle(fontSize: 16, letterSpacing: -1))
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
                status == "booked" || status == "finished"
                    ? const SizedBox()
                    : Padding(
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
                                        side: BorderSide(color: Colors.red))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
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
                        child: const Text("Call/Text Requester")),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                status == "booked" || status == "finished"
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                              onPressed: () async {
                                debugPrint(id);
                                Navigator.pop(context);
                                await FirebaseFirestore.instance
                                    .collection('gawa')
                                    .doc(id)
                                    .update({'status': 'booked'});
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: theme.colorScheme.primary))),
                                backgroundColor: MaterialStatePropertyAll(
                                    theme.colorScheme.primary),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
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
