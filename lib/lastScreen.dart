import 'package:flutter/material.dart';



class last extends StatelessWidget {
  final String name = 'ADMIN';
  final String phoneNumber = '021-3939220';
  final String address = 'Johar town, Lahore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'ADMIN PROFILE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(name),
                ),
                ListTile(
                  title: const Text('Phone Number'),
                  subtitle: Text(phoneNumber),
                ),
                ListTile(
                  title: const Text('Address'),
                  subtitle: Text(address),
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
  onPressed: () {
   
    Navigator.pop(context);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
  ),
  child: Text('Logout'),
),
          ),
        ],
      ),
    );
  }
}
