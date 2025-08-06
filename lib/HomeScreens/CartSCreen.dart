import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/PaymentScreens/PaymentScreen.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontSize: width * 0.06,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.cartItems.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.2),
                        child: Column(
                          children: [
                            Icon(Icons.shopping_cart_outlined,
                                size: 100, color: kGreyColor),
                            SizedBox(height: 20),
                            Text(
                              "Your cart is empty!",
                              style: TextStyle(fontSize: 20, color: kGreyColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return Card(
                        color: Colors.grey[100],
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item.product.image,
                                  height: height * 0.12,
                                  width: width * 0.22,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Sold by Shop Plus",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                    if (item.selectedSize != null)
                                      Text(
                                        "Size: ${item.selectedSize}",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                        ),
                                      ),
                                    if (item.selectedColor != null)
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: item.selectedColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: kGreyColor),
                                        ),
                                      ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${item.product.price.toStringAsFixed(2)} EG x ${item.quantity}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.remove_circle,
                                                  color: Colors.red),
                                              onPressed: () => cartProvider
                                                  .decrementQuantity(index),
                                            ),
                                            Text(
                                              item.quantity.toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Colors.green),
                                              onPressed: () => cartProvider
                                                  .incrementQuantity(index),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete_forever,
                                              color: Colors.red[400]),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      Text(
                                                        "Are you sure?",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.045),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        "Do you really want to remove this item from cart?",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text("Cancel",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04)),
                                                    onPressed: () =>
                                                        Navigator.of(ctx).pop(),
                                                  ),
                                                  TextButton(
                                                    child: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize:
                                                              width * 0.04),
                                                    ),
                                                    onPressed: () {
                                                      cartProvider
                                                          .removeItem(index);
                                                      Navigator.of(ctx).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.cartItems.isEmpty) return SizedBox.shrink();
                  return Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
              ),
              SizedBox(height: 10),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.cartItems.isEmpty) return SizedBox.shrink();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${cartProvider.totalPayment.toStringAsFixed(2)} EG",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.cartItems.isEmpty) return SizedBox.shrink();
                  return ContainerButton(
                    containerWidth: width,
                    itext: "CheckOut",
                    bgColor: kPrimaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
