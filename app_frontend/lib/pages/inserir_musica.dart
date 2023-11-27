import 'package:flutter/material.dart';
import 'package:app_frontend/components/insert_form_component.dart';

class InsertMusicView extends StatefulWidget {
  const InsertMusicView({Key? key}) : super(key: key);

  @override
  State<InsertMusicView> createState() => _InsertMusicViewState();
}

class _InsertMusicViewState extends State<InsertMusicView> {

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
      body: const SingleChildScrollView(
        child: InsertFormComponent()
      ),
    );
  }
}

