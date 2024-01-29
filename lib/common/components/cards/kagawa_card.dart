
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
    this.image = 'https://static.vecteezy.com/system/resources/previews/021/548/095/non_2x/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg',
  });

  @override
  Widget build(BuildContext context) {
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
        elevation: 1.6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image),
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
