
import 'package:app/profile/presentation/pages/kagawa_profile_page.dart';
import 'package:flutter/material.dart';


class KagawaCard extends StatelessWidget {
  final int id;
  final String role;
  final String name;
  final String image;

  const KagawaCard({
    super.key,
    required this.id,
    required this.role,
    required this.name,
    this.image = 'https://th.bing.com/th/id/OIP.ENu9hrlfzOB84klpy9Y20QHaHa?w=198&h=197&c=7&r=0&o=5&pid=1.7',
  });

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.black54,
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
