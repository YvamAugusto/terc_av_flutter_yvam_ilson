import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_frontend/components/form_component.dart';
import 'package:app_frontend/components/button_component.dart';
import 'package:http/http.dart';

class InsertMusicView extends StatefulWidget {
  const InsertMusicView({Key? key}) : super(key: key);

  @override
  State<InsertMusicView> createState() => _InsertMusicViewState();
}

class _InsertMusicViewState extends State<InsertMusicView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _albumController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();

  Future<bool> voltarPagina() async {
    return await showDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData(
          dialogBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
        ),
        child: AlertDialog(
          title: const Text(
            'Cancelar cadastro?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'NÃO',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'SIM',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ) ?? false;
  }

  Future<void> inserirMusica() async {
    if (_formKey.currentState!.validate()) {

      Map<String, dynamic> musicData = {
        'nome': _nomeController.text,
        'album': _albumController.text,
        'autor': _autorController.text,
        'genero': _generoController.text,
        'ano': _anoController,
        'duracao': _duracaoController.text,
      };

      final url = Uri.parse('http://192.168.16.108:8080/musicas');

      try {
        final response = await post(
          url,
          body: json.encode(musicData),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          print('Música inserida com sucesso!');
        } else {
          print('Erro ao inserir música: ${response.statusCode}');
        }
      } catch (error) {
        print('Erro ao inserir música: $error');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 223, 100),
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () async {
            bool shouldNavigate = await voltarPagina();
            if (shouldNavigate) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: const Row(
          children: [
            Text(
              'Adicionar Música',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormComponent(
              // formKey: _formKey,
              // nomeController: nomeController,
              // albumController: _albumController,
              // autorController: _autorController,
              // generoController: _generoController,
              // anoController: _anoController,
              // duracaoController: _duracaoController,
            ),
            ButtonComponent(
              onPressed: inserirMusica,
              color: const Color.fromARGB(255, 31, 223, 100),
              fontColor: Colors.black,
              borderColor: const Color.fromARGB(255, 31, 223, 100),
              text: 'Cadastrar',
            )
          ],
        ),
      ),
    );
  }
}

