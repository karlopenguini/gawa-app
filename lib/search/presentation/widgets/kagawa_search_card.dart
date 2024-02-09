import 'package:flutter/material.dart';
import 'package:app/profile/presentation/pages/kagawa_profile_page.dart';

class SearchCard extends StatelessWidget {
  final id;
  final double rating;
  final int numReviews;
  final String name;
  final String image;
  final int transactions;
  final List<String> certs;

  const SearchCard({
    super.key,
    required this.id,
    this.rating = 0.0,
    required this.name,
    this.transactions = 0,
    this.certs = const [],
    this.image =
        'https://th.bing.com/th/id/OIP.ENu9hrlfzOB84klpy9Y20QHaHa?w=198&h=197&c=7&r=0&o=5&pid=1.7',
    required this.numReviews,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KagawaProfilePage(id: 0),
            ),
          );
        },
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 40,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 64,
                    child: Text(name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            letterSpacing: -1,
                            fontSize: 14,
                            color: Colors.black54)),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(rating.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: -1,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '($numReviews reviews)',
                      style: TextStyle(
                          letterSpacing: -1,
                          fontSize: 12,
                          color: Colors.black54),
                    )
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    const Icon(Icons.check_circle_outline_rounded,
                        size: 14, color: Colors.black54),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("$transactions Gawa Transactions",
                        style: const TextStyle(
                          letterSpacing: -1,
                          color: Colors.black54,
                          fontSize: 12,
                        ))
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  for (var cert in certs)
                    Column(
                      children: [
                        Row(children: [
                          const Icon(Icons.assignment_outlined,
                              size: 14, color: Colors.black54),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(cert,
                              style: const TextStyle(
                                letterSpacing: -1,
                                color: Colors.black54,
                                fontSize: 12,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(Icons.copy,
                              size: 12, color: Colors.black54)
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
