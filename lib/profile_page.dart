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
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/images/mr.baer.png')),
              SizedBox(height: 60),
              Text('Mr.Bär',
                  style: (TextStyle(
                      fontSize: 38,
                      color: Color.fromARGB(255, 86, 12, 165),
                      fontWeight: FontWeight.bold))),
              Text('APP-Entwickler',
                  style: (TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 86, 12, 165),
                      fontWeight: FontWeight.bold))),
              SizedBox(
                height: 8,
              ),
              Text(
                  'Mein Name ist Dirk Müller, ich bin ein passionierter App-Entwickler, der gerade dabei ist, seine Karriere in der digitalen Welt zu gestalten. Neben meiner Arbeit findet ich Erfüllung in der Natur und schätzt die Zeit meiner Familie. Als Vater zweier Kinder legt ich großen Wert auf menschliche Werte und eine ausgewogene Work-Life-Balance.',
                  style: (TextStyle(
                    fontSize: 16,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
