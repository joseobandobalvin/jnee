import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/sentence.dart';

class CardSentence extends StatelessWidget {
  final Sentence sentence;
  const CardSentence(this.sentence, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const Text(
            "N° de expediente:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${sentence.txExpedientePenal}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Fecha sentencia firme:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${sentence.feSentenciaPenal}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Órgano judicial:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${sentence.txOrganoJudiPenal}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Delito:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${sentence.txDelitoPenal}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Fallo o pena:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${sentence.txFalloPenal}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
