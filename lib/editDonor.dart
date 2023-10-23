import 'package:flutter/material.dart';
import 'package:mid/map.dart';

class EditDonorPage extends StatefulWidget {
  final String name;
  final String age;
  final String bloodGroup;
  final String phoneNumber;
  final Function(String, String, String, String) onSave;

  EditDonorPage({
    required this.name,
    required this.age,
    required this.bloodGroup,
    required this.phoneNumber,
    required this.onSave,
  });

  @override
  _EditDonorPageState createState() => _EditDonorPageState();
}

class _EditDonorPageState extends State<EditDonorPage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController bloodGroupController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with the current donor details
    nameController = TextEditingController(text: widget.name);
    ageController = TextEditingController(text: widget.age);
    bloodGroupController = TextEditingController(text: widget.bloodGroup);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  void dispose() {
    // Dispose of text controllers to avoid memory leaks
    nameController.dispose();
    ageController.dispose();
    bloodGroupController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Donor'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: bloodGroupController,
                decoration: InputDecoration(labelText: 'Blood Group'),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final editedName = nameController.text;
                    final editedAge = ageController.text;
                    final editedBloodGroup = bloodGroupController.text;
                    final editedPhoneNumber = phoneNumberController.text;

                    // Call the onSave function to save the edited details
                    widget.onSave(
                      editedName,
                      editedAge,
                      editedBloodGroup,
                      editedPhoneNumber,
                    );

                    // Navigate back to the donor details page
                 Navigator.push(context, MaterialPageRoute(builder:(context) => MapPage(),));
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
