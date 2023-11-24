import 'package:app_frontend/components/card_component.dart';
import 'package:app_frontend/model/musica.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class MusicListView extends StatefulWidget {
  const MusicListView({super.key});

  @override
  State<MusicListView> createState() => _MusicListViewState();
}

class _MusicListViewState extends State<MusicListView> {
  List<Musica> listaDeMusicas = [];

  Future<void> getMusics() async {
    const String url = 'http://localhost:8080/musicas';

    try {
      Response resposta = await get(Uri.parse(url));

      if (resposta.statusCode == 200) {
        List<dynamic> resultados = json.decode(resposta.body);

        setState(() {
          listaDeMusicas = resultados.map((result) => Musica.fromJson(result)).toList();
          print(listaDeMusicas);
        });
      } else {
        print('Erro na requisição: ${resposta.statusCode}');
      }
    } catch (e) {
      // Trate os erros de requisição aqui
      print('Erro ao obter músicas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    getMusics();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 223, 100),
        toolbarHeight: 80,
        title: Row(
          children: [
            IconButton(
              icon: Image.asset(
                'lib/assets/logo-spotify.png',
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            const Text(
              'Minha Playlist',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: ListView.builder(
              itemCount: listaDeMusicas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('sla'), // Supondo que o título esteja em 'title', ajuste conforme sua estrutura de dados
                    subtitle: Text('sla'), // Substitua por sua subinformação, ou deixe vazio se não houver
                    // Outros elementos do card podem ser adicionados conforme necessário
                  ),
                );
              },
            ),
    );
  }
}
