import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_frontend/components/form_component.dart';
import 'package:app_frontend/components/button_component.dart';
import 'package:http/http.dart';

class EditMusicView extends StatefulWidget {
  const EditMusicView({Key? key}) : super(key: key);

  @override
  State<EditMusicView> createState() => _EditMusicViewState();
}

class _EditMusicViewState extends State<EditMusicView> {

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

  Future<bool> deletarMusica() async{
    return true;
  }

  Future<bool> editarMusica() async{
    return true;
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
              'Editar Música',
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
        ),
      ),
    );
  }
}