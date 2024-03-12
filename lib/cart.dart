// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';




class CartItem {
  final String name;
  final String price;
  final String description;

  CartItem({
    required this.name,
    required this.price,
    required this.description,
  });
}

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
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
          title: Text('Online Shopping'),
        ),
        body: SingleChildScrollView(
          child: EcommerceProductList(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingCartPage(),
                      ),
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
            // Add other products
          ],
        ),
        // Add other product categories
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
              color: Colors.black,
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
    final cart = Provider.of<Cart>(context);

    return SizedBox(
      width: 200,
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
                cart.addToCart(CartItem(
                  name: name,
                  price: price,
                  description: description,
                ));
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

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(cart.items[index].name),
          subtitle: Text(cart.items[index].description),
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              cart.removeFromCart(cart.items[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: ${calculateTotal(cart)}'),
              ElevatedButton(
                onPressed: () {
                  cart.clearCart();
                },
                child: Text('Clear Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculateTotal(Cart cart) {
    double total = 0;
    for (var item in cart.items) {
      total += double.parse(item.price.replaceAll('₹', ''));
    }
    return '₹${total.toStringAsFixed(2)}';
  }
}
