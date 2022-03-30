import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  const CheckOut({
    required this.image,
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);


  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
              width: 130,
              decoration:  BoxDecoration(
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
                      '\$ ${widget.price}',
                      style: const TextStyle(
                        color: Color(
                          0xff9b96d6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Quantity'),
                          Text('1'),
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

  Widget _buildBottomDetail(
      {required String startName, required String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          endName,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Checkout Screen',
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
            'Buy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            debugPrint('Checked out');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                // color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSingleCartScreen(),
              _buildSingleCartScreen(),
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomDetail(
                      startName: 'Your Price',
                      endName: '\$ 60.00',
                    ),
                    _buildBottomDetail(
                      startName: 'Discount',
                      endName: '3%',
                    ),
                    _buildBottomDetail(
                      startName: 'Shipping',
                      endName: '\$ 60.00',
                    ),
                    _buildBottomDetail(
                      startName: 'Total',
                      endName: '\$ 120',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
