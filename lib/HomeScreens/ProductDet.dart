import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/Style.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/Models/ProductModel.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? _selectedSize;
  Color? _selectedColor;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Product Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: AppConstants.largeSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.title,
                    style: kSubHeadingTextStyle,
                  ),
                  Text(
                    "${widget.product.price.toStringAsFixed(2)} EGP",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "${widget.product.reviews} reviews",
                    style: TextStyle(color: kGreyColor),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.largeSpacing),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              Text(
                widget.product.description,
                style: kBodyTextStyle,
              ),
              SizedBox(height: AppConstants.largeSpacing),
              if (widget.product.availableSizes.isNotEmpty) ...[
                Text(
                  "Select Size",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppConstants.mediumSpacing),
                Wrap(
                  spacing: 8,
                  children: widget.product.availableSizes.map((size) {
                    return ChoiceChip(
                      label: Text(size),
                      selected: _selectedSize == size,
                      onSelected: (selected) {
                        setState(() {
                          _selectedSize = selected ? size : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: AppConstants.largeSpacing),
              ],
              if (widget.product.availableColors.isNotEmpty) ...[
                Text(
                  "Select Color",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: AppConstants.mediumSpacing),
                Wrap(
                  spacing: 8,
                  children: widget.product.availableColors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedColor == color
                                ? kPrimaryColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: AppConstants.largeSpacing),
              ],
              Text(
                "Quantity",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_quantity > 1) {
                        setState(() {
                          _quantity--;
                        });
                      }
                    },
                  ),
                  Text(
                    "$_quantity",
                    style: TextStyle(fontSize: screenWidth * 0.05),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: AppConstants.extraLargeSpacing),
              ContainerButton(
                containerWidth: screenWidth,
                itext: "Add to Cart",
                bgColor: kPrimaryColor,
                onTap: () {
                  if ((widget.product.availableSizes.isNotEmpty &&
                          _selectedSize == null) ||
                      (widget.product.availableColors.isNotEmpty &&
                          _selectedColor == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select size and color"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  cartProvider.addProductToCart(
                    widget.product,
                    size: _selectedSize,
                    color: _selectedColor,
                    quantity: _quantity,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${widget.product.title} added to cart!"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
