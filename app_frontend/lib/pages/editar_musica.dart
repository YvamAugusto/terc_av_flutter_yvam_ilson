import 'package:flutter/material.dart';
import 'package:app_frontend/components/edit_form_component.dart';
import 'package:app_frontend/model/musica.dart';

class EditMusicView extends StatefulWidget {
  const EditMusicView({Key? key}) : super(key: key);

  @override
  State<EditMusicView> createState() => _EditMusicViewState();
}

class _EditMusicViewState extends State<EditMusicView> {

  Future<bool> voltarPagina() async {
    return await showDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData(
          dialogBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
        ),
        child: AlertDialog(
          title: const Text(
            'Cancelar edição?',
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

  @override
  Widget build(BuildContext context) {

    final musica = ModalRoute.of(context)!.settings.arguments as Musica;

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
        child: EditFormComponent(musica: musica),
      ),
    );
  }
}