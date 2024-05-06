import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/aditional_information.dart';

class CardAditionalInformation extends StatelessWidget {
  final AditionalInformation aditionalInformation;
  const CardAditionalInformation(this.aditionalInformation, {super.key});

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
            "Detalle información adicional:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${aditionalInformation.infoAdicional}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
