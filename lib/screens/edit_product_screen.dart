import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();
    
    // Untuk versi MVP, kita hanya kembali ke layar sebelumnya
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produk berhasil ditambahkan/diperbarui!')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Harap isi nama produk.';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga (Rp)'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Harap isi harga.';
                  if (double.tryParse(value) == null) return 'Masukkan angka yang valid.';
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi Singkat'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL Gambar'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _saveForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
