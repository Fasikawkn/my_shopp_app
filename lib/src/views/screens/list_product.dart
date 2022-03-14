import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/views/screens/homepage.dart';
import '../widgets/single_product.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({required this.name, Key? key}) : super(key: key);
  final String name;
  Widget _buildFeatureProduct(String name, double price, String image) {
    return Card(
      child: SizedBox(
        height: 250,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                // color: Colors.blueGrey,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/$image',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              '\$ $price',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Color(0xff9b96d6),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 700,
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.63,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: const [
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                      SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
