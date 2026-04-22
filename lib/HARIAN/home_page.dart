import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76D1FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. Banner Promo
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF39D200),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Shopee.svg/1200px-Shopee.svg.png',
                              height: 50,
                            ), // Placeholder Shopee
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("DISCOUNT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
                              const Text("10.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.red)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text("S & K Berlaku, periode des 2025", style: TextStyle(color: Colors.white, fontSize: 8)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Grid Menu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {}, child: const Text("Lihat Semua Promo", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 5,
                      children: List.generate(10, (index) => _buildMenuItem()),
                    ),
                  ],
                ),
              ),

              // 3. Flash Sale Section
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFDAB9), 
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Flash Sale", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red)),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) => _buildProductCard()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
        ],
      ),
    );
  }

  Widget _buildMenuItem() {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(color: Color(0xFFE6E6FA), shape: BoxShape.circle),
        ),
        const SizedBox(height: 5),
        const Text("Produk", style: TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('https://cdn-icons-png.flaticon.com/512/3075/3075977.png', height: 100), // Burger Icon
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Text("Nama Barang 500 gram", style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Burger instan merek bjurgrr", style: TextStyle(fontSize: 11)),
                Text("Rp. 35.000,-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("produk online\nstok terbatas", style: TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}