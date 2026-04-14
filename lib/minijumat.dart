import 'package:flutter/material.dart';

void main() => runApp(const JagoFrameworkApp());

class JagoFrameworkApp extends StatelessWidget {
  const JagoFrameworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JagoFrameworkPage(),
    );
  }
}

class JagoFrameworkPage extends StatelessWidget {
  const JagoFrameworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              _box(height: 50, color: Colors.grey[300]!, label: "Header Section"),
              const SizedBox(height: 20),

             
              _box(height: 120, color: Colors.amber[100]!, label: "Kantong Utama (Balance Card)"),
              const SizedBox(height: 20),

             
              Row(
                children: [
                  Expanded(child: _box(height: 60, color: Colors.blue[100]!, label: "Transfer")),
                  const SizedBox(width: 10),
                  Expanded(child: _box(height: 60, color: Colors.blue[100]!, label: "Scan QRIS")),
                ],
              ),
              const SizedBox(height: 25),

              
              _box(height: 150, color: Colors.purple[100]!, label: "Spotlight / Promo Banner"),
              const SizedBox(height: 25),

       
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: List.generate(4, (index) => 
                  _box(height: 80, color: Colors.teal[100]!, label: "Shortcut ${index + 1}")
                ),
              ),
              const SizedBox(height: 20),
              
             
              _box(height: 50, color: Colors.grey[200]!, label: "+ Tambah Shortcut"),
            ],
          ),
        ),
      ),
      // 7. Bottom Navigation
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.grey[300],
        child: const Center(child: Text("Bottom Navigation Bar")),
      ),
    );
  }

 
  Widget _box({required double height, required Color color, required String label}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ),
    );
  }
}