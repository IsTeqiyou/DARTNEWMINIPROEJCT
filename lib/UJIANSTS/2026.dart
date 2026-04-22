import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Flutter',
      home: HttpApi(),
    );
  }
}

class HttpApi extends StatefulWidget {
  const HttpApi({super.key});

  @override
  State<HttpApi> createState() => _HttpApiState();
}

class _HttpApiState extends State<HttpApi> {
  List<dynamic> data = [];
  bool isLoading = true;

  Future ambilData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      var hasil = jsonDecode(response.body);
      setState(() {
        data = hasil['products'];
        isLoading = false;
      });
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: const Text("THIS IS PROEJECT KU")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 12, 
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Image.network(data[index]['images'][0], height: 100),
                      const SizedBox(height: 5),
                      Text(data[index]['title'], 
                           maxLines: 1, 
                           overflow: TextOverflow.ellipsis,
                           style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Rating: ${data[index]['rating']}"),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Rp ${data[index]['price']}"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Stok: ${data[index]['stock']}"),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}