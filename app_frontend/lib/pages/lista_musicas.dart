import 'package:app_frontend/components/card_component.dart';
import 'package:app_frontend/model/musica.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response, get;
import 'dart:convert';
import 'package:app_frontend/pages/inserir_musica.dart';

class MusicListView extends StatefulWidget {
  const MusicListView({super.key});

  @override
  State<MusicListView> createState() => _MusicListViewState();
}

class _MusicListViewState extends State<MusicListView> {
  List<Musica> listaDeMusicas = [];

  @override
  void initState() {
    super.initState();
    getMusics();
  }

  Future<void> getMusics() async {
    const String url = 'http://192.168.16.108:8080/musicas'; 
    // Alterar para o IP da máquina do professor, esse era o problema kkkkkkkk.

    try {
      Response resposta = await get(Uri.parse(url));
      if (resposta.statusCode == 200) {
        List<dynamic> resultados = json.decode(resposta.body);
        setState(() {
          listaDeMusicas = resultados.map((result) => Musica.fromJson(result)).toList();
        });
      } else {
        print('Erro na requisição: ${resposta.statusCode}');
      }
    } catch (e) {
      print('Erro ao obter músicas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: listaDeMusicas.length,
              itemBuilder: (context, index) {
                Musica musica = listaDeMusicas[index];
                return CardComponent(musica: musica);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 31, 223, 100),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InsertMusicView()), // Substitua 'InserirMusicasPage' pelo nome correto da sua página
          );
        },
        child: const Icon(Icons.add, color: Colors.black, size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

}
