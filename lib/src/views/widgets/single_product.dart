import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    required this.image,
    required this.name,
    required this.price,
    Key? key}) : super(key: key);

  final String image;
  final double price;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(
                // color: Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/$image',
                  ),
                ),
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
}
