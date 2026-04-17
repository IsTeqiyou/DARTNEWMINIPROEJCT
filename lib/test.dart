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
      theme: ThemeData(),
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

    // var hasil = jsonDecode(response.body);

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
      appBar: AppBar(title: Text("Latihan Ambil DATA")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: data.take(5).map((item) {
                // return ListTile(
                //   title: Row(children: [Text("title : "), Text(item['title'])]),
                //   subtitle: Row(children: [Text("description : "), Text(item['description'])]),
                // );
                return Container(
                  height: 220,
                  width: 200,
                  color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child:Column(
                    spacing: 10,
                    children: [
                      Image.network(item['images'][0],height: 150, width: 150),
                      Text(item['title']),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
