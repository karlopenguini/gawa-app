import 'dart:ffi';

import 'package:app/search/data/search_list.dart';
import 'package:app/search/presentation/widgets/kagawa_search_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  Future<Map<String, dynamic>> getKagawa() async {
    final userQuery = FirebaseFirestore.instance
        .collection('user')
        .where('is_kagawa', isEqualTo: true)
        .get();

    final transactionsQuery = FirebaseFirestore.instance
        .collection('gawa')
        .where('status', isEqualTo: 'finished')
        .get();

    final reviewsQuery = FirebaseFirestore.instance.collection('review').get();

    final List<QuerySnapshot> results =
        await Future.wait([userQuery, transactionsQuery, reviewsQuery]);

    final Map<String, dynamic> combinedResults = {
      'userData': results[0],
      'transactionsData': results[1],
      'reviewsData': results[2]
    };

    return combinedResults;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(13, 32, 13, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.chevron_left, color: theme.colorScheme.primary),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: theme.colorScheme.primary,
              ),
              onPressed: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home",
                    style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2)),
                Text("Blk 3, Lot 21, Solen Residences",
                    style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.primary,
                        letterSpacing: 0.8))
              ],
            )
          ],
        ),
        FutureBuilder<Object>(
            future: getKagawa(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final userData = snapshot.data!['userData']!.docs;

                QuerySnapshot transactionsData =
                    snapshot.data!['transactionsData'];
                QuerySnapshot reviewsData = snapshot.data!['reviewsData'];

                return Expanded(
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> userDataMap =
                          userData[index].data() as Map<String, dynamic>;

                      int transactions = transactionsData.docs
                          .where((gawa) =>
                              gawa['kagawa'] == userData.docs[index].reference)
                          .length;
                      int numReviews = reviewsData.docs
                          .where((review) =>
                              review['kagawa'] ==
                              userData.docs[index].reference)
                          .length;

                      List<QueryDocumentSnapshot> userReviews = reviewsData.docs
                          .where((gawa) =>
                              gawa['kagawa'] == userData.docs[index].reference)
                          .toList();
                      double ratingAvg = userReviews.isEmpty
                          ? 0.0
                          : userReviews
                                  .map<double>(
                                      (review) => review['rating'].toDouble())
                                  .fold(
                                      0.0,
                                      (previous, current) =>
                                          previous + current) /
                              userReviews.length;

                      return SearchCard(
                        id: userData[index].id,
                        name: userDataMap['first_name'] +
                            ' ' +
                            userDataMap['middle_name'] +
                            ' ' +
                            userDataMap['last_name'],
                        certs: [],
                        rating: ratingAvg,
                        numReviews: numReviews,
                        transactions: transactions,
                        image:
                            'https://cdn.freebiesupply.com/logos/large/2x/pug-logo-png-transparent.png',
                      );
                    },
                  ),
                );
              }
            }),
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
