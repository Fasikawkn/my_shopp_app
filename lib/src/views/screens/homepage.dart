import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../widgets/single_product.dart';
import 'detailscreen.dart';
import 'list_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Fasikaw Kindye',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
            ),
            currentAccountPicture: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/man_profile.jpeg')),
            accountEmail: Text(
              'fasikawkn@gmail.com',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            selected: homeColor,
            enabled: true,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              setState(() {
                homeColor = true;
                contactColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            selected: cartColor,
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              setState(() {
                cartColor = true;
                contactColor = false;
                homeColor = false;
                aboutColor = false;
              });
            },
          ),
          ListTile(
            selected: aboutColor,
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              setState(() {
                aboutColor = true;
                contactColor = false;
                cartColor = false;
                homeColor = false;
              });
            },
          ),
          ListTile(
            selected: contactColor,
            leading: const Icon(Icons.phone),
            title: const Text('Contact Us'),
            onTap: () {
              setState(() {
                contactColor = true;
                aboutColor = false;
                cartColor = false;
                homeColor = false;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryProduct(String image, int color) {
    return CircleAvatar(
      maxRadius: 30,
      backgroundColor: Color(color),
      backgroundImage: AssetImage('assets/images/$image'),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 200,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: const <AssetImage>[
          AssetImage(
            'assets/images/men_shirt_img.jpg',
          ),
          AssetImage(
            'assets/images/men_jacket.jpg',
          ),
          AssetImage(
            'assets/images/men_watch.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'View more',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryProduct('clothe_one.jpg', 0xff33dcfd),
              _buildCategoryProduct('clothe_two.jpg', 0xff33dcfd),
              _buildCategoryProduct('clothe_two.jpg', 0xff33dcfd),
              _buildCategoryProduct('clothe_two.jpg', 0xff33dcfd),
              _buildCategoryProduct('clothe_two.jpg', 0xff33dcfd),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              const ListProduct(name: 'Featured'),
                        ),
                      );
                    },
                    child: const Text(
                      'View more',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const DetailScreen(
                                      name: 'Man Long- Shirt',
                                      price: 30.0,
                                      image: 'clothe_one.jpg',
                                    )));
                      },
                      child: const SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const DetailScreen(
                                      name: 'Man Long- Shirt',
                                      price: 30.0,
                                      image: 'clothe_one.jpg',
                                    )));
                      },
                      child: const SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewAchive() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Achives',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (context) => const ListProduct(
                            name: 'New Achves',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View more',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const DetailScreen(
                                      name: 'Man Long- Shirt',
                                      price: 30.0,
                                      image: 'clothe_one.jpg',
                                    )));
                      },
                      child: const SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const DetailScreen(
                                      name: 'Man Long- Shirt',
                                      price: 30.0,
                                      image: 'clothe_one.jpg',
                                    )));
                      },
                      child: const SingleProduct(
                        name: 'Man Long- Shirt',
                        price: 30.0,
                        image: 'clothe_one.jpg',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  bool homeColor = true;
  bool cartColor = false;
  bool aboutColor = false;
  bool contactColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
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
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                _buildImageSlider(),
                _buildCategory(),
                _buildFeature(),
                _buildNewAchive(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
