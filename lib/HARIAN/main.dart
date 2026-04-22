// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HttpApi extends StatefulWidget {
//   const HttpApi({super.key});

//   @override
//   State<HttpApi> createState() => _HttpApiState();
// }

// class _HttpApiState extends State<HttpApi> {
//   List data = [];
//   bool isLoading = true;

//   Future ambilData() async {
//     var response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//     );

//     var hasil = jsonDecode(response.body);

//     setState(() {
//       data = hasil;
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     ambilData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Latihan Ambil DATA")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView(
//               children: data.map((item) {
//                 return ListTile(title: Text(item['title']));
//               }).toList(),
//             ),
//     );
//   }
// }