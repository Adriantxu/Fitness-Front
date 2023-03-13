import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyInformationPage()),
                );
              },
              child: Row(
                children: const [
                  Text(
                    'My information',
                    style: TextStyle(
                      fontSize: 18.0,
                      height: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18.0,
                height: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Change password'),
              leading: const Icon(Icons.lock),
              onTap: () {
                // navigate to the change password screen
              },
            ),
            ListTile(
              title: const Text('Delete account'),
              leading: const Icon(Icons.delete),
              onTap: () {
                // show confirmation dialog before deleting the account
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Information'),
      ),
      body: const Center(
        child: Text('This is the My Information page.'),
      ),
    );
  }
}
