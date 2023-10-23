import 'package:flutter/material.dart';
import 'package:mid/alldonors.dart';

class homeScreen extends StatelessWidget {
  final List<String> bloodGroups = ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('JOHAR TOWN, LAHORE'),
        actions: [Image.asset('assets/image.png')],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/map.png'),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Blood Groups',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: bloodGroups
                    .map((group) => BloodGroupTile(bloodGroup: group))
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Align buttons in the center
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle SHOW ALL button click
                         Navigator.push(context, MaterialPageRoute(builder: (context) => DonorList()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color(0xffEB3738), // Text color
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red), // Button border
                          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                        ),
                      ),
                      child: Text('SHOW ALL'),
                    ),
                    SizedBox(width: 16), // Add some spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle ADD NEW DONOR button click
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color(0xffEB3738), // Text color
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red), // Button border
                          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                        ),
                      ),
                      child: Text('ADD NEW DONOR'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BloodGroupTile extends StatefulWidget {
  final String bloodGroup;

  BloodGroupTile({required this.bloodGroup});

  @override
  _BloodGroupTileState createState() => _BloodGroupTileState();
}

class _BloodGroupTileState extends State<BloodGroupTile> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        width: 40, // Set the width to create a square box
        height: 25, // Set the height to create a square box
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isTapped ? Colors.redAccent : Colors.white,
          border: Border.all(color: Colors.redAccent, width: 2.0),
        ),
        child: Center(
          child: Text(
            widget.bloodGroup,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
