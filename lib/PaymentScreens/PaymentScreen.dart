import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/PaymentScreens/Address.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';
import 'package:shope_pluse/Provider/payment_provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    final subTotal = cartProvider.totalPayment;
    const shippingFee = 50.0;
    final totalPayment = subTotal + shippingFee;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Payment",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: kWhiteColor, fontSize: 20),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.largePadding),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return _buildPaymentOption(
                        context,
                        paymentProvider,
                        1,
                        "Amazon Pay",
                        "assets/img/amazon.png",
                        screenWidth,
                        screenHeight,
                      );
                    },
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return _buildPaymentOption(
                        context,
                        paymentProvider,
                        2,
                        "Visa",
                        "assets/img/visa.png",
                        screenWidth,
                        screenHeight,
                      );
                    },
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return _buildPaymentOption(
                        context,
                        paymentProvider,
                        3,
                        "Paypal",
                        "assets/img/paypal.png",
                        screenWidth,
                        screenHeight,
                      );
                    },
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return _buildPaymentOption(
                        context,
                        paymentProvider,
                        4,
                        "Cash",
                        "assets/img/cash.png",
                        screenWidth,
                        screenHeight,
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.12),
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
                    itext: "Confirm Payment",
                    bgColor: kPrimaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    PaymentProvider paymentProvider,
    int value,
    String text,
    String imagePath,
    double screenWidth,
    double screenHeight,
  ) {
    bool isSelected = paymentProvider.selectedPaymentType == value;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? kPrimaryColor : kGreyColor.withOpacity(0.3),
          width: isSelected ? 1.5 : 0.8,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                    value: value,
                    groupValue: paymentProvider.selectedPaymentType,
                    onChanged: paymentProvider.handleRadioSelection,
                    activeColor: kPrimaryColor,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? kBlackColor : kGreyColor,
                    ),
                  ),
                ],
              ),
              Image.asset(
                imagePath,
                width: screenWidth * 0.15,
                height: screenHeight * 0.06,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      ),
    );
  }
}
