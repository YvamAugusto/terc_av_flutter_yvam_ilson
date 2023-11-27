import 'package:flutter/material.dart';
import 'package:app_frontend/components/button_component.dart';
import 'package:http/http.dart';
import 'package:app_frontend/model/musica.dart';
import 'dart:convert';

class EditFormComponent extends StatefulWidget {

  final Musica musica;

  const EditFormComponent({Key? key, required this.musica}) : super(key: key);

  @override
  _EditFormComponentState createState() => _EditFormComponentState();
}

class _EditFormComponentState extends State<EditFormComponent> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _albumController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();

  Future<void> editarMusica() async {

    if (_formKey.currentState!.validate()) {
        
        Map<String, dynamic> musicData = {
          'id': int.parse(_idController.text),
          'nome': _nomeController.text,
          'album': _albumController.text,
          'autor': _autorController.text,
          'genero': _generoController.text,
          'ano': int.parse(_anoController.text),
          'duracao': _duracaoController.text,
        };

        final idMusica = int.parse(_idController.text);
        final url = Uri.parse('http://192.168.16.108:8080/musicas/$idMusica');

        try {
          final response = await put(
            url,
            body: json.encode(musicData),
            headers: {
              'Content-Type': 'application/json',
            },
          );
          if (response.statusCode == 200) {
            print('Música editada com sucesso!');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/musicas',
              (Route<dynamic> route) => false,
            );
          } else {
            print('Erro ao editar música: ${response.statusCode}');
          }
        } catch (error) {
          print('Erro ao editar música: $error');
        }
    }
  }

  Future<void> deletarMusica() async {

    final idMusica = int.parse(_idController.text);
    final url = Uri.parse('http://192.168.16.108:8080/musicas/$idMusica');

    try {
      final response = await delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print('Música deletada com sucesso!');
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/musicas',
          (Route<dynamic> route) => false,
        );
      } else {
        print('Erro ao deletar música: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao deletar música: $error');
    }
  }

  @override
  Widget build(BuildContext context) {

    final musica = ModalRoute.of(context)!.settings.arguments as Musica;

    _idController.text = musica.id.toString();
    _nomeController.text = musica.nome;
    _albumController.text = musica.album;
    _autorController.text = musica.autor;
    _generoController.text = musica.genero;
    _anoController.text = musica.ano.toString();
    _duracaoController.text = musica.duracao;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nomeController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe o nome da música.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _albumController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Álbum',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe o álbum da música.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _autorController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Autor',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe o autor da música.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _generoController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Gênero',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe o gênero da música.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _anoController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Ano',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe o ano de lançamento.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _duracaoController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Duração',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 31, 223, 100)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, informe a duração da música.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonComponent(
                  onPressed: deletarMusica,
                  color: const Color.fromARGB(255, 29, 29, 29),
                  fontColor: const Color.fromARGB(255, 31, 223, 100),
                  borderColor: const Color.fromARGB(255, 31, 223, 100),
                  text: 'Excluir',
                ),
                const SizedBox(width: 10),
                ButtonComponent(
                  onPressed: editarMusica,
                  color: const Color.fromARGB(255, 31, 223, 100),
                  fontColor: Colors.black,
                  borderColor: const Color.fromARGB(255, 31, 223, 100),
                  text: 'Salvar',
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
