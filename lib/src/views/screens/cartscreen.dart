import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Detail Screen',
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
      body: SizedBox(
        height: 140,
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/men_shirt_img.jpg'),
                  ),
                ),
              ),
             const SizedBox(
                height: 140,
                child: ListTile(
                  title: Text('date')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
