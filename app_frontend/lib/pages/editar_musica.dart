// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class EditarMusicaView extends StatefulWidget {
//   const EditarMusicaView({super.key});

//   @override
//   State<EditarMusicaView> createState() => _EditarMusicaViewState();
// }

// class _EditarMusicaViewState extends State<EditarMusicaView> {

//   buscarMusicas() async {
//     try {
//       final response = await http.get(Uri.parse("https://localhost:8080/musicas"));
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         setState(() {
//           dadosFinanceiros = responseData;
//         });
//       } else {
//         throw Exception('Não foi possível realizar a requisição.');
//       }
//     } catch (e) {
//       print('Erro na requisição: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     buscarMusicas();
    
//     return Scaffold(
//       appBar: AppBar(title: const Text('Moedas')),
//       body: Column(),
//     );
    

// }