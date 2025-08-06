import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/PaymentScreens/OrderSuccsess.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    final subTotal = cartProvider.totalPayment;
    const shippingFee = 50.0;
    final totalPayment = subTotal + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Order",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConstants.mediumSpacing),
                Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppConstants.defaultPadding),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.largePadding),
                  width: screenWidth,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    color: kLightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dear customer",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "EL-Shabab 135M",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                        Text(
                          "EL-Obour City,Qaliobya,Egypt",
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppConstants.largeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: AppConstants.largeSpacing),
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Image.asset("assets/img/visa.png",
                          fit: BoxFit.contain),
                    ),
                    SizedBox(width: AppConstants.mediumSpacing),
                    Text(
                      "**** **** **** 7613",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.largeSpacing),
                Text(
                  "Delivery Method",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppConstants.mediumSpacing),
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/img/fedex.png",
                            height: screenHeight * 0.08,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppConstants.largeSpacing),
                    Container(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/img/moving.png",
                            height: screenHeight * 0.08,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub_Total",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      "${subTotal.toStringAsFixed(2)} EG",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.largeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping Fee",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      "${shippingFee.toStringAsFixed(2)} EG",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: AppConstants.extraLargeSpacing,
                  thickness: 1,
                  color: kGreyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                    Text(
                      "${totalPayment.toStringAsFixed(2)} EG",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w800,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                ContainerButton(
                  containerWidth: screenWidth,
                  itext: "Confirm Order",
                  bgColor: kPrimaryColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSuccessScreen(),
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
