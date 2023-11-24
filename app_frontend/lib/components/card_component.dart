import 'package:app_frontend/model/musica.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Musica? musica;
  const CardComponent({super.key, this.musica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(musica!.nome,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(musica!.album,
            style: const TextStyle(color: Colors.white, fontSize: 15)),
        const SizedBox(height: 5),
        Text(musica!.autor,
            style: const TextStyle(color: Colors.white, fontSize: 15))
      ]),
    );
  }
}
