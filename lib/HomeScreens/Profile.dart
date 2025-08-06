import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/HomeScreens/NavigatorScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Omnia Osama';
  String phone = '01122334455';
  String address = 'EL-Obour City';
  String email = 'omnia.osama@gmail.com';

  void _showEditDialog(
      String title, String currentValue, Function(String) onSave) {
    final TextEditingController controller =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: title,
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: kGreyColor)),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text.trim());
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              child: Text('Save', style: TextStyle(color: kWhiteColor)),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: screenWidth * 0.055,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            CircleAvatar(
              radius: screenWidth * 0.18,
              backgroundImage: AssetImage('assets/img/me2.jpg'),
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              name,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildProfileItem(
              icon: Icons.person,
              title: 'Name',
              subtitle: name,
              onEdit: (value) => setState(() => name = value),
              screenWidth: screenWidth,
            ),
            SizedBox(height: 16),
            _buildProfileItem(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: phone,
              onEdit: (value) => setState(() => phone = value),
              screenWidth: screenWidth,
            ),
            SizedBox(height: 16),
            _buildProfileItem(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: address,
              onEdit: (value) => setState(() => address = value),
              screenWidth: screenWidth,
            ),
            SizedBox(height: 16),
            _buildProfileItem(
              icon: Icons.email,
              title: 'Email',
              subtitle: email,
              onEdit: (value) => setState(() => email = value),
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.05),
            ContainerButton(
              containerWidth: screenWidth,
              itext: "Complete Shopping",
              bgColor: kPrimaryColor,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()),
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required double screenWidth,
    required Function(String) onEdit,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          backgroundColor: kPrimaryColor.withOpacity(0.1),
          child: Icon(icon, color: kPrimaryColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.042,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: screenWidth * 0.038,
            color: kGreyColor,
            height: 1.3,
          ),
        ),
        trailing: Icon(Icons.edit, size: 20, color: kGreyColor),
        onTap: () {
          _showEditDialog(title, subtitle, onEdit);
        },
      ),
    );
  }
}
