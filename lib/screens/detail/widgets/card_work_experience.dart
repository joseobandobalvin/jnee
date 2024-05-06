import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/work_experience.dart';

class CardWorkExperience extends StatelessWidget {
  final WorkExperience workExperience;
  const CardWorkExperience(this.workExperience, {super.key});

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
            "NOMBRE DEL CENTRO DE PRESTACIÓN DEL SERVICIO O TRABAJO:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${workExperience.centroTrabajo}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            //height: 10.0,
            child: Text(
              "RUC: ${workExperience.rucTrabajo}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "OFICIO / OCUPACIÓN / PROFESIÓN:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${workExperience.ocupacionProfesion}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            //height: 10.0,
            child: Text(
              "${workExperience.anioTrabajoDesde} - ${workExperience.anioTrabajoHasta}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "DIRECCIÓN DEL CENTRO DE TRABAJO:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${workExperience.trabajoPais}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${workExperience.trabajoDepartamento} / ${workExperience.trabajoProvincia} / ${workExperience.trabajoDistrito}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kDarkBlue,
            ),
          ),
          Text(
            "${workExperience.direccionTrabajo}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
