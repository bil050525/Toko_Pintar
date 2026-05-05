import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart'; // Nama rute untuk navigasi

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Memanggil data keranjang dari CartProvider
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
      ),
      body: Column(
        children: [
          // Bagian Atas: Ringkasan Harga & Tombol Checkout
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'Rp ${cart.totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: cart.totalAmount <= 0
                        ? null
                        : () {
                            // TODO: Fitur Checkout Kirim ke WhatsApp (sesuai blueprint)
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Checkout berhasil!')),
                            );
                            cart.clear(); // Kosongkan keranjang setelah checkout
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('CHECKOUT'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Bagian Bawah: Daftar Barang di Keranjang
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                // Mengambil nilai item dari Map (karena CartProvider menggunakan Map)
                final cartItem = cart.items.values.toList()[i];
                
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Icon(Icons.shopping_bag, color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                    title: Text(cartItem.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Harga: Rp ${cartItem.price}'),
                    trailing: Text(
                      '${cartItem.quantity} x',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
