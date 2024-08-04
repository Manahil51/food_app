import 'package:final_hackathon/views/categories/product.dart';

import 'package:final_hackathon/views/home/navigation/productview.dart';
import 'package:final_hackathon/views/widgets/productcard.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Burger',
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/11/25/17/17/sandwich-2977251_1280.jpg',
        price: 29.99,
      ),
      Product(
        name: 'fries',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/20/09/06/bowl-1842294_1280.jpg',
        price: 19.99,
      ),
      Product(
        name: 'pizza',
        imageUrl:
            'https://cdn.pixabay.com/photo/2014/04/22/02/56/pizza-329523_1280.jpg',
        price: 49.99,
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildCategories(),
            _buildGrid(products),
            _buildSponsored(),
            SizedBox(
              height: 20,
            ),
            _buildNewArrivals(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("View All"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: const TextStyle(fontSize: 16),
              side: const BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }

  Widget _buildSponsored() {
    final List<Product> sponsoredProducts = [
      Product(
        name: 'Order Now',
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/05/29/17/01/hamburger-8026582_1280.jpg',
        price: 5.99,
      ),
      Product(
        name: 'Pizza',
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/01/03/11/22/pizza-1949157_960_720.jpg',
        price: 8.99,
      ),
      Product(
        name: 'Dessert',
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/03/30/15/47/churros-2188871_1280.jpg',
        price: 12.99,
      ),
      Product(
        name: 'Pasta',
        imageUrl:
            'https://cdn.pixabay.com/photo/2024/04/26/12/24/food-8721773_1280.jpg',
        price: 7.99,
      ),
      Product(
        name: 'Burger and Fries',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/21/15/52/french-fries-1846083_1280.jpg',
        price: 6.99,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Sponsored Products",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sponsoredProducts.map((product) {
              return Container(
                width: 300,
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNewArrivals(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Fastest near you',
          actionText: 'View all',
          actionOnTap: () {},
        ),
        const SizedBox(height: 8),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 200,
                width: 400,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Search(),
                      ),
                    );
                  },
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2023/07/26/16/43/food-8151625_960_720.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String actionText,
    required VoidCallback actionOnTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: actionOnTap,
          child: Text(actionText),
        ),
      ],
    );
  }
}
