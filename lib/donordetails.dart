import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mid/editDonor.dart';

class DonorDetailsPage extends StatelessWidget {
  final String name;
  final String age;
  final String bloodGroup;
  final String phoneNumber;

  DonorDetailsPage({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $name',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('Age: $age', style: TextStyle(fontSize: 25)),
                SizedBox(height: 20),
                Text('Blood Group: $bloodGroup', style: TextStyle(fontSize: 25)),
                SizedBox(height: 20),
                Text('Phone Number: $phoneNumber', style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/map2.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add logic to handle calling
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.phone),
                  label: Text('Call'),
                ),
                SizedBox(width: 40), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDonorPage(
                          name: name,
                          age: age,
                          bloodGroup: bloodGroup,
                          phoneNumber: phoneNumber,
                          onSave: (String editedName, String editedAge, String editedBloodGroup, String editedPhoneNumber) async {
                            try {
                              // Get a reference to the Firestore instance
                              final firestore = FirebaseFirestore.instance;

                              const documentPath = 'donors/1WJC8yVsVTwwfbRiGPGi'; 

                              // Create a map with the updated donor details
                              final updatedData = {
                                'name': editedName,
                                'age': editedAge,
                                'bloodGroup': editedBloodGroup,
                                'phoneNumber': editedPhoneNumber,
                              };

                              // Update the donor document in Firestore
                              await firestore.doc(documentPath).update(updatedData);

                              // Inform the user that the data has been updated (you can use a snackbar or other UI feedback)
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Donor information updated successfully'),
                              ));
                            } catch (e) {
                              // Handle errors, e.g., inform the user about the error
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Error: ${e.toString()}'),
                              ));
                            }
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
