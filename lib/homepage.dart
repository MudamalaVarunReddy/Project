// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'iperson.dart';
import 'cart.dart';
import 'more.dart';

void main() {
  runApp(EcommerceHomePage());
}

class EcommerceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(170, 100, 65, 65),
          title: Row(
            children: [
              _icon(),
              SizedBox(width: 5),
              Text(
                'Online Shopping       ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: EcommerceProductList(),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(170, 106, 65, 65),
          child: Container(
            height: 50, // Decrease the height of the bottom navigation bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EcommerceHomePage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                userName: 'John Doe',
                                userEmail: 'john.doe@example.com',
                                userPhone: '+1234567890',
                              )),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_bag, color: Colors.white),
                  onPressed: () {
                    // Add functionality for orders option
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingCartPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DropdownExample()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class EcommerceProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductCategory(
          title: 'Watches',
          products: [
            {
              'name': 'Fastrack',
              'image': 'assets/images/watch1.jpg',
              'price': '₹1069',
              'description': 'Fastrack Analog Unisex-Adult Watch',
            },
            {
              'name': 'Casio',
              'image': 'assets/images/watch2.jpg',
              'price': '₹957',
              'description': 'Casio Enticer Analog Dial Watch',
            },
            {
              'name': 'Fire-Boltt',
              'image': 'assets/images/watch3.jpg',
              'price': '₹1036',
              'description':
                  'Fire-Boltt Talk 2 Pro Ultra 1.39" Round Display Stainless Steel Luxury Smart Watch, Bluetooth Calling & 360 Health Monitoring, 123 Sports Modes, Inbuilt Voice Assistant (Silver)',
            },
            {
              'name': 'Titan',
              'image': 'assets/images/watch4.jpg',
              'price': '₹1549',
              'description':
                  "Titan Neo Analog Silver Dial Men's Watch-NL1734WL01/NP1734WL01",
            },
            {
              'name': 'Fossil',
              'image': 'assets/images/watch5.jpeg',
              'price': '₹1350',
              'description':
                  "Fossil Gen 6 Digital Black Dial Men's Watch-FTW4059",
            },
          ],
        ),
        ProductCategory(
          title: 'Dresses',
          products: [
            {
              'name': 'Dennis Lingo',
              'image': 'assets/images/dresses6.jpg',
              'price': '₹793',
              'description':
                  "Dennis Lingo Men's Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves ",
            },
            {
              'name': 'Ethluxis',
              'image': 'assets/images/dresses7.jpg',
              'price': '₹590',
              'description':
                  "Ethluxis® Men's Silk Blend Kurta Churidar Pyjama with Ethnic Bundi Jacket Set",
            },
            {
              'name': 'Peter England',
              'image': 'assets/images/dresses8.jpg',
              'price': '₹1099',
              'description':
                  "Peter England Men's Slim Fit 100% Cotton Printed Shirt",
            },
            {
              'name': 'U.S. POLO ASSN.',
              'image': 'assets/images/dresses9.jpg',
              'price': '₹1390',
              'description':
                  'U.S. Polo Assn. Men Light Beige Premium Cotton Striped Casual Shirt',
            },
            {
              'name': 'WINTAGE',
              'image': 'assets/images/dresses10.jpg',
              'price': '₹1039',
              'description': 'WINTAGE Men Regular Fit blazer',
            },
          ],
        ),
        ProductCategory(
          title: 'Shoes',
          products: [
            {
              'name': 'Columbia',
              'image': 'assets/images/shoes1.jpg',
              'price': '₹643',
              'description': "Columbia Men's Black, Black Hiking Boots",
            },
            {
              'name': 'Density',
              'image': 'assets/images/shoes2.jpg',
              'price': '₹954',
              'description':
                  "Density Men's Casual Eva Socks Kintted Shoes (White & Black_Model_A09)",
            },
            {
              'name': 'Sparx',
              'image': 'assets/images/shoes3.jpg',
              'price': '₹1067',
              'description': 'SPARX Mens Sm 648sports Running Shoes',
            },
            {
              'name': 'adidas',
              'image': 'assets/images/shoes4.jpg',
              'price': '₹964',
              'description': 'adidas Mens Drogo M Running Shoe',
            },
            {
              'name': 'Campus',
              'image': 'assets/images/shoes5.jpg',
              'price': '₹665',
              'description': 'Campus Mens Crysta ProRunning Shoes',
            },
          ],
        ),
      ],
    );
  }
}

class ProductCategory extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;

  ProductCategory({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color:
                  Color.fromARGB(255, 25, 38, 45), // Set category title color
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products.map((product) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductItem(
                  name: product['name'],
                  image: product['image'],
                  price: product['price'],
                  description: product['description'],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String description;

  ProductItem({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set width of the product item
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Price: $price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Implement onTap action
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 48, 60),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
