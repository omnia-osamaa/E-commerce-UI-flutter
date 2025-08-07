import 'package:flutter/material.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/PaymentScreens/OrderConfirmScreen.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          "Shipping Details",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(color: kWhiteColor),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.largePadding),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, size: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, size: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers, size: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.location_city, size: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Icon(Icons.place, size: screenWidth * 0.06),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                ContainerButton(
                  containerWidth: screenWidth,
                  itext: "Confirm",
                  bgColor: kPrimaryColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderConfirmScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
