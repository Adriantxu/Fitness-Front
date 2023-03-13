import 'package:flutter/material.dart';
import 'search_bar.dart';
import 'settings.dart';
import 'chat_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> products = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
  ];
  final List<String> cart = [];
  final Set<String> favorites = {};

  void addToCart(String product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeFromCart(String product) {
    setState(() {
      cart.remove(product);
    });
  }

  void addToFavorite(String product) {
    setState(() {
      favorites.add(product);
    });
  }

  void removeFromFavorite(String product) {
    setState(() {
      favorites.remove(product);
    });
  }

  bool isInCart(String product) {
    return cart.contains(product);
  }

  bool isFavorite(String product) {
    return favorites.contains(product);
  }

  void toggleFavorite(String product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('FAQ'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Chat'),
                  ),
                ];
              },
              onSelected: (value) {
                switch (value) {
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                    break;
                  case 1:
                    // Perform action for Menu item 3
                    break;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cart: cart),
                  ),
                );
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cart: cart),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Fitness App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(product),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: isFavorite(product)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    toggleFavorite(product);
                  },
                ),
                isInCart(product)
                    ? IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          removeFromCart(product);
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          addToCart(product);
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<String> cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            title: Text(product),
          );
        },
      ),
    );
  }
}
