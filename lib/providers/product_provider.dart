import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Kemeja Flannel Pria',
      price: 150000,
      description: 'Kemeja flannel lengan panjang dengan bahan katun premium. Cocok untuk acara kasual maupun semi-formal.',
      imageUrl: 'https://images.unsplash.com/photo-1598033129183-c4f50c736f10?w=500&q=80',
    ),
    Product(
      id: 'p2',
      name: 'Sepatu Sneakers Putih',
      price: 350000,
      description: 'Sepatu sneakers klasik warna putih yang mudah dipadukan dengan outfit apapun. Nyaman dipakai seharian.',
      imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500&q=80',
    ),
    Product(
      id: 'p3',
      name: 'Jam Tangan Minimalis',
      price: 250000,
      description: 'Jam tangan dengan desain minimalis dan elegan. Strap kulit sintetis berkualitas.',
      imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500&q=80',
    ),
    Product(
      id: 'p4',
      name: 'Tas Ransel Kanvas',
      price: 180000,
      description: 'Tas ransel berkapasitas besar cocok untuk sekolah, kuliah, atau bekerja.',
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&q=80',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
