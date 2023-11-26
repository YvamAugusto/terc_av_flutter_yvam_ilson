import 'package:app_frontend/model/musica.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Musica? musica;
  const CardComponent({super.key, this.musica});

  @override
  Widget build(BuildContext context) {

    String nomeMusica = musica!.nome;
    if (nomeMusica.length > 20) {
      nomeMusica = '${nomeMusica.substring(0, 30)}...';
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 34, 34, 34),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nomeMusica,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    musica!.album + '  |  ',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    musica!.autor + '  |  ',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    musica!.duracao,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    musica!.genero + '  |  ',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    musica!.ano.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

