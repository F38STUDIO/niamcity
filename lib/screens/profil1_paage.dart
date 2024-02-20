import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/couleurs.dart';
import '../widgets/profile_item.dart';

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            InkWell(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 90,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Couleurs.b),
                    child: const Icon(Icons.edit),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            itemProfile('Name', 'Team Flutter', Icons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '51829319', Icons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'sousse Riadh', Icons.location_city),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Couleurs.d,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Modifier',
                    style: TextStyle(color: Couleurs.a, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
