
import 'package:flutter/material.dart';

void main() {
  runApp(const TechHubApp());
}

const Color background = Color(0xFF09090D);
const Color cardColor = Color(0xFF191922);
const Color blue = Color(0xFF347CF6);
const Color white = Colors.white;

class TechHubApp extends StatelessWidget {
  const TechHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechHub',
      theme: ThemeData.dark(),
      home: const ProductListingScreen(),
    );
  }
}

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'TechHub',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: white),
          SizedBox(width: 20),
          Icon(Icons.notifications_none, color: white),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search smartphones, gadgets...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.tune, color: white),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Smartphones (24)',
              style: TextStyle(
                color: white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: productCard(
                    'Galaxy S25 Ultra',
                    '₱999',
                    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: productCard(
                    'iPhone Pro Max',
                    '₱1,199',
                    'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=500',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: productCard(
                    'Foldable 5G Phone',
                    '₱1,499',
                    'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: productCard(
                    'Elite Edition X',
                    '₱599',
                    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: cardColor,
        selectedItemColor: blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget productCard(String name, String price, String image) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(13),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                image,
                height: 125,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 125,
                    color: const Color(0xFF252535),
                    child: const Icon(
                      Icons.smartphone,
                      size: 55,
                      color: blue,
                    ),
                  );
                },
              ),
            ),
            const Positioned(
              right: 6,
              bottom: 6,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: blue,
                child: Icon(
                  Icons.shopping_cart,
                  color: white,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 15),
            Text(
              ' 4.9',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          price,
          style: const TextStyle(
            color: white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: const Icon(Icons.arrow_back, color: white),
        actions: const [
          Icon(Icons.share_outlined, color: white),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: cardColor,
                        child: const Center(
                          child: Icon(
                            Icons.smartphone,
                            color: blue,
                            size: 120,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Positioned(
                  top: 12,
                  left: 12,
                  child: Chip(
                    backgroundColor: blue,
                    label: Text(
                      'TOP FLAGSHIP',
                      style: TextStyle(
                        color: white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Text(
              'Model X Pro',
              style: TextStyle(
                color: white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  '₱1,099',
                  style: TextStyle(
                    color: blue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.amber, size: 17),
                Text(
                  ' 4.9 (124 reviews)',
                  style: TextStyle(color: white, fontSize: 12),
                ),
              ],
            ),
            const Divider(color: Colors.white24, height: 30),
            const Text(
              'SELECT COLOR',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                CircleAvatar(radius: 13, backgroundColor: Colors.black),
                SizedBox(width: 15),
                CircleAvatar(radius: 13, backgroundColor: Colors.white),
                SizedBox(width: 15),
                CircleAvatar(radius: 13, backgroundColor: blue),
                SizedBox(width: 15),
                CircleAvatar(radius: 13, backgroundColor: Colors.amber),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'STORAGE CAPACITY',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                StorageOption('128GB'),
                SizedBox(width: 10),
                StorageOption('256GB'),
                SizedBox(width: 10),
                StorageOption('512GB'),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'KEY TECHNICAL SPECS',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 15),
            specification('Connection', 'Ultra-Fast 5G'),
            specification('Display', 'OLED 120Hz Screen'),
            specification('Camera Setup', 'Triple Lens 108MP'),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 17),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class StorageOption extends StatelessWidget {
  final String label;

  const StorageOption(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: white, fontSize: 12),
      ),
    );
  }
}

Widget specification(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(color: white),
        ),
      ],
    ),
  );
}
