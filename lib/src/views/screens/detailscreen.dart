import 'package:flutter/material.dart';
import 'homepage.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;

  const DetailScreen(
      {required this.image, required this.name, required this.price, Key? key})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget _buildSizeProduct(String name) {
    return Container(
      height: 60,
      width: 60,
      color: const Color(0xfff2f2f2),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget _buildColorProduct(Color color) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  int count = 1;

  Widget _buildImage() {
    return Center(
      child: SizedBox(
        width: 350,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${widget.image}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return SizedBox(
      height: 100.0,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '\$ ${widget.price}',
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff9b96d6)),
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescripion() {
    return SizedBox(
      height: 170,
      child: Wrap(
        children: const [
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170,
          child: Wrap(
            children: const [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        const Text(
          'Size',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 265,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSizeProduct('S'),
              _buildSizeProduct('M'),
              _buildSizeProduct('L'),
              _buildSizeProduct('XXL'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 265,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorProduct(Colors.green),
              _buildColorProduct(Colors.blue),
              _buildColorProduct(Colors.grey),
              _buildColorProduct(Colors.pink)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Quantity',
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(
                20.0,
              )),
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
    );
  }

  Widget _buildButtonPart() {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
            ),
            child: const Text(
              'Check Out',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              debugPrint('Checked out');
            },
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
        title: const Text(
          'Detail Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => HomePage(),
              ),
            );
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///////////
            _buildImage(),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameToDescriptionPart(),
                  // _buildDescripion(),
                  _buildSizePart(),
                  _buildColorPart(),
                  _buildQuantityPart(),
                  _buildButtonPart(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
