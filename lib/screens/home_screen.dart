import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: Colors.black54, size: 20),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.black54, size: 20),
                  onPressed: () {
                    _showImageSourceDialog(context);
                  },
                ),
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
          IconButton(
            icon: const Icon(Icons.chat_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur Chat segera hadir!')),
              );
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
    void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Kamera'),
            onTap: () async {
              Navigator.of(ctx).pop();
              final picker = ImagePicker();
              final image = await picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gambar berhasil diambil: ${image.name}')),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Galeri'),
            onTap: () async {
              Navigator.of(ctx).pop();
              final picker = ImagePicker();
              final image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gambar dipilih dari galeri: ${image.name}')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
