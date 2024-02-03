
import 'package:app/profile/presentation/pages/kagawa_profile_page.dart';
import 'package:flutter/material.dart';


class GawainCard extends StatelessWidget {
  final int id;
  final String name;
  final String title;
  final bool suki;
  final DateTime time;
  final String location;
  final String image;

  const GawainCard({
    super.key,
    required this.name,
    required this.id,
    required this.title,
    this.suki = false,
    this.image = 'https://th.bing.com/th/id/OIP.ENu9hrlfzOB84klpy9Y20QHaHa?w=198&h=197&c=7&r=0&o=5&pid=1.7',
    required this.location,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KagawaProfilePage(id: id),
          ),
        );
      },
      child: Card(
        elevation: 1.6,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(image),
                      backgroundColor: Colors.black54,
                    ),
                    SizedBox(height: 3,),
                    Text(name,
                        style: const TextStyle(
                            letterSpacing: -0.7, color: Colors.black54, fontSize: 14))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.7,
                              fontSize: 16)),
                      SizedBox(height: 3,),
                      if (suki)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(Icons.check_circle_outline_sharp,
                                size: 17,
                                color: theme.colorScheme.outline,),
                            ),
                            const Text('#KaSuki',
                                style: TextStyle(
                                    letterSpacing: -0.7, color: Colors.black54, fontSize: 14)),
                          ],
                        ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(Icons.access_time_sharp,
                              size: 17,
                              color: theme.colorScheme.outline,),
                          ),
                          Text("${time.hour.toString()}:${time.minute.toString()}",
                              style: const TextStyle(
                                  letterSpacing: -0.7, color: Colors.black54, fontSize: 14)),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(Icons.pin_drop_outlined,
                              size: 17,
                              color: theme.colorScheme.outline,),
                          ),
                          Expanded(
                            child: Text(location,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,

                                style: const TextStyle(
                                    letterSpacing: -0.7, color: Colors.black54, fontSize: 14)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
