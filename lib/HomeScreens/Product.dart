import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Constant/containerBoxbutton.dart';
import 'package:shope_pluse/HomeScreens/CartSCreen.dart';
import 'package:shope_pluse/Models/DataModel.dart';
import 'package:shope_pluse/Models/ProductModel.dart';
import 'package:shope_pluse/Provider/cart_provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final iStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  String? _selectedSize;
  Color? _selectedColor;
  int _quantity = 1;
  late String _mainImage;

  @override
  void initState() {
    super.initState();
    _mainImage = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Product Details",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: kWhiteColor, fontSize: 20),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: (widget.product.additionalImages.isNotEmpty
                      ? widget.product.additionalImages
                      : [widget.product.image])
                  .map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: screenWidth,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: screenHeight * 0.4,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _mainImage = (widget.product.additionalImages.isNotEmpty
                        ? widget.product.additionalImages
                        : [widget.product.image])[index];
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.split(" ").first + ":",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.product.title,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
                Text(
                  "${widget.product.price.toStringAsFixed(2)} EGP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                RatingBar(
                  initialRating: widget.product.reviews / 100.0,
                  maxRating: 5,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  halfFilledIcon: Icons.star_half,
                  filledColor: kAccentColor,
                  size: 24,
                  onRatingChanged: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "${widget.product.reviews / 100.0} (${widget.product.reviews} Reviews)",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.description.isNotEmpty
                  ? widget.product.description
                  : kRating,
              style:
                  TextStyle(color: Colors.black87, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 24),
            ContainerButton(
              containerWidth: screenWidth * 0.9,
              itext: "Buy Now",
              bgColor: kPrimaryColor,
              onTap: () {
                _showProductDetailsBottomSheet(
                    context, widget.product, cartProvider);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showProductDetailsBottomSheet(
      BuildContext context, Product product, CartProvider cartProvider) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Image.asset(
                        _mainImage,
                        key: ValueKey(_mainImage),
                        height: 180,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: (product.additionalImages.isNotEmpty
                            ? product.additionalImages
                            : [product.image])
                        .map((img) => GestureDetector(
                              onTap: () => setState(() {
                                _mainImage = img;
                              }),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _mainImage == img
                                        ? kPrimaryColor
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  img,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text("${product.reviews / 100.0}", style: iStyle),
                      SizedBox(width: 5),
                      Text("(${product.reviews} reviews)",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (product.availableSizes.isNotEmpty) ...[
                    Text("Size:", style: iStyle),
                    Wrap(
                      spacing: 10,
                      children: product.availableSizes
                          .map((size) =>
                              _buildSizeOption(context, setState, size))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                  if (product.availableColors.isNotEmpty) ...[
                    Text("Color:", style: iStyle),
                    Wrap(
                      spacing: 10,
                      children: product.availableColors
                          .map((color) =>
                              _buildColorOption(context, setState, color))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                  Text("Quantity:", style: iStyle),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (_quantity > 1) setState(() => _quantity--);
                        },
                      ),
                      Text('$_quantity', style: iStyle),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() => _quantity++);
                        },
                      ),
                    ],
                  ),
                  Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: iStyle),
                      Text(
                        "EGP ${(product.price * _quantity).toStringAsFixed(2)}",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Text("You saved 0%!", style: TextStyle(color: Colors.green)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (product.availableSizes.isNotEmpty &&
                          _selectedSize == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please select a size"),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      }
                      if (product.availableColors.isNotEmpty &&
                          _selectedColor == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please select a color"),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      }

                      cartProvider.addProductToCart(
                        product,
                        size: _selectedSize,
                        color: _selectedColor,
                        quantity: _quantity,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${product.title} added to cart!"),
                        backgroundColor: Colors.green,
                      ));

                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Center(
                      child: Text("Add to Cart",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Other Products", style: iStyle),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final similarProduct =
                            (AppData.products..shuffle()).firstWhere(
                          (p) => p.id != product.id,
                          orElse: () => AppData.products.first,
                        );
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductScreen(product: similarProduct)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              similarProduct.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSizeOption(
      BuildContext context, StateSetter setState, String size) {
    bool isSelected = _selectedSize == size;

    bool isAvailable = true;

    return GestureDetector(
      onTap: () {
        if (isAvailable) setState(() => _selectedSize = size);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : kGreyColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              size,
              style: TextStyle(
                color: isSelected ? kWhiteColor : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(
      BuildContext context, StateSetter setState, Color color) {
    bool isSelected = _selectedColor == color;

    bool isAvailable = true;

    return GestureDetector(
      onTap: () {
        if (isAvailable) setState(() => _selectedColor = color);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 34,
        width: 34,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: kPrimaryColor, width: 2)
              : Border.all(color: Colors.grey.shade300),
        ),
        child: isSelected
            ? Icon(Icons.check, color: Colors.white, size: 18)
            : null,
      ),
    );
  }
}
