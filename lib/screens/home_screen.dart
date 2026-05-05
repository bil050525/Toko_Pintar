import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/product_item.dart';
import '../screens/admin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoPintar'),
        actions: [
          Container(
            width: 160,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: Colors.black54, size: 20),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 9.0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Menu Toko'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Katalog Belanja'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Manajemen Toko'),
              onTap: () {
                Navigator.of(context).pushNamed(AdminScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: products.isEmpty
          ? const Center(child: Text('Belum ada produk.'))
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (ctx, i) => ProductItem(products[i].id),
            ),
    );
  }
}
