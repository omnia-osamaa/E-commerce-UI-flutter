import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_pluse/Constant/Colors.dart';
import 'package:shope_pluse/Provider/favorite_provider.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(color: kWhiteColor),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        elevation: 3,
        centerTitle: true,
      ),
      body: favoriteProvider.favoriteItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 100, color: kGreyColor),
                  SizedBox(height: 20),
                  Text(
                    "No items in favorites.",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteProvider.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteProvider.favoriteItems[index];
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.product.price.toStringAsFixed(2)} EG",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    icon:
                                        Icon(Icons.favorite, color: Colors.red),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text("Remove Item"),
                                          content: Text(
                                              "Are you sure you want to remove this item from favorites?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(ctx).pop(),
                                              child: Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      kPrimaryColor),
                                              onPressed: () {
                                                favoriteProvider
                                                    .removeItem(index);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text("Remove",
                                                  style: TextStyle(
                                                      color: kWhiteColor)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    tooltip: "Remove from favorites",
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
            ),
    );
  }
}
