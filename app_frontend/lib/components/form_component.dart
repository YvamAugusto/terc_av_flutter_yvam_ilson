import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {
  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _albumController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
      ),
    );
  }
}
