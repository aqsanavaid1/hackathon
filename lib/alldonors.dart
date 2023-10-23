import 'package:flutter/material.dart';
import 'package:mid/donordetails.dart';

class DonorList extends StatelessWidget {
  DonorList({super.key});

  // Sample donor data
  final List<Map<String, String>> donors = [
    {
      'name': 'John Doe',
      'age': '30',
      'bloodGroup': 'A+',
      'phoneNumber': '123-456-7890',
    },
    {
      'name': 'Jane Smith',
      'age': '25',
      'bloodGroup': 'B-',
      'phoneNumber': '987-654-3210',
    },
    {
      'name': 'Alice Johnson',
      'age': '28',
      'bloodGroup': 'O+',
      'phoneNumber': '555-123-4567',
    },
    {
      'name': 'Bob Anderson',
      'age': '35',
      'bloodGroup': 'A-',
      'phoneNumber': '444-789-1234',
    },
    {
      'name': 'Charlie Brown',
      'age': '40',
      'bloodGroup': 'AB+',
      'phoneNumber': '222-888-9999',
    },
    {
      'name': 'David Davis',
      'age': '35',
      'bloodGroup': 'B+',
      'phoneNumber': '333-666-7777',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL DONORS'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          final donor = donors[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust the margin
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(20), // Make it more rounded
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Name: ${donor['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${donor['age']} years old'),
                  Text('Blood Group: ${donor['bloodGroup']}'),
                  Text('Phone: ${donor['phoneNumber']}'),
                ],
              ),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DonorDetailsPage(
        name: donor['name'] ?? '',
        age: donor['age'] ?? '',
        bloodGroup: donor['bloodGroup'] ?? '',
        phoneNumber: donor['phoneNumber'] ?? '',
      ),
    ),
  );
},
            ),
          );
        },
      ),
    );
  }
}
