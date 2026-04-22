import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      home: const SplashScreen(),
    );
  }
}


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.flash_on, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "WELCOME",
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      body: SingleChildScrollView( 
        child: Column(
          children: [
           
            SizedBox(
              height: 180,
              child: PageView(
                children: [
                  _buatSlide("Halaman 1", Colors.orange),
                  _buatSlide("Halaman 2", Colors.green),
                  _buatSlide("Halaman 3", Colors.red),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Menu Utama", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2, // 2 kolom
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
                children: [
                  _buatMenu("Menu 1", Icons.home),
                  _buatMenu("Menu 2", Icons.settings),
                  _buatMenu("Menu 3", Icons.person),
                  _buatMenu("Menu 4", Icons.notifications),
                ],
              ),
            ),

            const SizedBox(height: 20),

           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blueAccent),
                    SizedBox(height: 10),
                    Text("Bagian Lebar di Bawah", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Isi info penting atau promo di sini.", textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buatSlide(String teks, Color warna) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(teks, style: const TextStyle(color: Colors.white, fontSize: 20))),
    );
  }

  Widget _buatMenu(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.    black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}