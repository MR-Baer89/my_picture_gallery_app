import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/mr.baer.png')),
            SizedBox(height: 20),
            Text('Dirk Müller'),
            Text('Mr.Bär'),
          ],
        ),
      ),
    );
  }
}
