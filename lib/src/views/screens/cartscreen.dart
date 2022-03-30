import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/views/screens/checkout.dart';

class CartScreen extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  const CartScreen({
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget _buildSingleCartScreen() {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/${widget.image}'),
                ),
              ),
            ),
            SizedBox(
              height: 140,
              width: 200,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.name),
                    const Text('Cloths'),
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        color: Color(
                          0xff9b96d6,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xfff2f2f2,
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              debugPrint('The amount is $count');
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff746bc9),
            shape: const RoundedRectangleBorder(),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            debugPrint('Checked out');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => const CheckOut(
                  name: 'Men Shirt Long',
                  image: 'men_shirt_img.jpg',
                  price: 60.0,
                ),
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Cart Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute<void>(
            //     builder: (context) => HomePage(),
            //   ),
            // );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSingleCartScreen(),
          _buildSingleCartScreen(),
          _buildSingleCartScreen(),
          _buildSingleCartScreen(),
          _buildSingleCartScreen(),
          _buildSingleCartScreen(),
        ],
      ),
    );
  }
}
