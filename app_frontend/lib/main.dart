import 'package:flutter/material.dart';
import 'package:app_frontend/pages/lista_musicas.dart';
import 'package:app_frontend/pages/inserir_musica.dart';
import 'package:app_frontend/pages/editar_musica.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/musicas',
      routes: {
        '/musicas': (context) => const MusicListView(),
        '/inserirMusica': (context) => const InsertMusicView(),
        '/editarMusica': (context) => const EditMusicView(),
      }
    );
  }
}











