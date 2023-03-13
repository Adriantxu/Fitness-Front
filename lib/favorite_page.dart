import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favorite;

  const FavoritePage({required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: ListView.builder(
        itemCount: favorite.length,
        itemBuilder: (context, index) {
          final product = favorite[index];
          return ListTile(
            title: Text(product),
          );
        },
      ),
    );
  }
}
