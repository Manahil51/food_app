import 'package:final_hackathon/utils/color.dart';
import 'package:final_hackathon/views/widgets/customElevatedbutton.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Map<int, bool> _isChecked = {0: false, 1: false, 2: false};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Image.network(
            'https://cdn.pixabay.com/photo/2015/04/06/16/21/korean-food-709606_1280.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height / 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              print('Favorite icon pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              print('Menu icon pressed');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildContainerPasta(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildFlavourSelection(),
            ),
            CustomElevatedButton(
              backgroundColor: const Color.fromARGB(255, 9, 20, 113),
              label: "    Add to Basket    ",
              onPressed: () {},
            ),
            const Divider()
          ],
        ),
      ),
    );
  }

  Widget _buildContainerPasta() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 5, 25, 105),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Creamy Pasta',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Rich and creamy pasta with a blend of savory cheeses and spices.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Preparation Time: 30 minutes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Serves: 4',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlavourSelection() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 5, 25, 105),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Noodle Flavour:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(3, (index) {
                  return CheckboxListTile(
                    title: Text(
                      'Noodle Flavor ${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    value: _isChecked[index],
                    onChanged: (value) {
                      setState(() {
                        _isChecked[index] = value!;
                      });
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
