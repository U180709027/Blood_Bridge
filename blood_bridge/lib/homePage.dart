import 'package:blood_bridge/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:blood_bridge/_SettingsPageState.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME PAGE ',
          style: TextStyle(
            color: Color.fromARGB(255, 60, 152, 192),
            fontSize: 45,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 152, 192),
              ),
              accountName: Text(
                'Halil İbrahim Yavaş',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                'halilibrahimyavas@example.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    'B+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                color: Color.fromARGB(255, 60, 152, 192),
              ),
              title: const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 60, 152, 192),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Color.fromARGB(255, 60, 152, 192),
              ),
              title: const Text(
                'Help and Support',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 60, 152, 192),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 60, 152, 192),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 60, 152, 192),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 60, 152, 192),
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 60, 152, 192),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Urgent need for blood',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 152, 192),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Blood donation requests',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 152, 192),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Blood donation centers',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
