import 'package:flutter/material.dart';

void main() {
  runApp(const setting());
}

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, how are you today?',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'PROFILE',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          const ListTile(
            title: Text('Full Name'),
            subtitle: Text('Abas Mohamed'),
          ),
          const ListTile(
            title: Text('Email'),
            subtitle: Text('Abas@gmail.com'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'ACCOUNT',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          ListTile(
            title: const Text('Change password'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
