import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/HomeScreens/Product.dart';
import 'package:shope_pluse/Models/DataModel.dart';
import 'package:shope_pluse/Provider/favorite_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: screenHeight * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: kPrimaryColor),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: kBlackColor),
                              decoration: InputDecoration(
                                hintText: 'Search for products, brands...',
                                hintStyle: TextStyle(
                                    color: kBlackColor.withOpacity(0.5)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.notification_add,
                        color: kWhiteColor, size: screenWidth * 0.06),
                  )
                ],
              ),
              SizedBox(height: AppConstants.largeSpacing),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("A Summer Surprise",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth * 0.045,
                        )),
                    SizedBox(height: 6),
                    Text("Cashback 30%",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth * 0.065,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.largeSpacing),
              Text(
                "Special for you",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              SizedBox(
                height: screenHeight * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.tabs.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          AppData.tabs[index],
                          style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppConstants.largeSpacing),
              SizedBox(
                height: screenHeight * 0.32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.products.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: AppConstants.mediumSpacing),
                  itemBuilder: (context, index) {
                    final product = AppData.products[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductScreen(product: product)),
                      ),
                      child: Container(
                        width: screenWidth * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kLightGreyColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    product.image,
                                    height: screenHeight * 0.2,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      favoriteProvider
                                          .addOrRemoveFavorite(product);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            favoriteProvider.isFavorite(product)
                                                ? "Added to favorites"
                                                : "Removed from favorites",
                                          ),
                                        ),
                                      );
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 4,
                                              offset: Offset(0, 2))
                                        ],
                                      ),
                                      child: Icon(
                                        favoriteProvider.isFavorite(product)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            favoriteProvider.isFavorite(product)
                                                ? Colors.red
                                                : kPrimaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.04)),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.stars,
                                          color: kAccentColor, size: 16),
                                      SizedBox(width: 4),
                                      Text("(${product.reviews})"),
                                      Spacer(),
                                      Text(
                                          "${product.price.toStringAsFixed(2)}EG",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold)),
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
                ),
              ),
              SizedBox(height: AppConstants.largeSpacing),
              Text(
                "Newest Product",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              GridView.builder(
                itemCount: AppData.products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppConstants.largeSpacing,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = AppData.products[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductScreen(product: product)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kLightGreyColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.image,
                                  height: screenHeight * 0.22,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    favoriteProvider
                                        .addOrRemoveFavorite(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          favoriteProvider.isFavorite(product)
                                              ? "Added to favorites"
                                              : "Removed from favorites",
                                        ),
                                      ),
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2))
                                      ],
                                    ),
                                    child: Icon(
                                      favoriteProvider.isFavorite(product)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          favoriteProvider.isFavorite(product)
                                              ? Colors.red
                                              : kPrimaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.title,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.stars,
                                        color: kAccentColor, size: 16),
                                    SizedBox(width: 4),
                                    Text("(${product.reviews})"),
                                    Spacer(),
                                    Text(
                                        "${product.price.toStringAsFixed(2)}EG",
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
