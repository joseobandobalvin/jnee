import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:jnee/models/general_data.dart';

class DetailBasicInformationX extends StatelessWidget {
  final GeneralData generalData;
  const DetailBasicInformationX(this.generalData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(generalData.numeroDocumento),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Political(generalData),
                    Info(generalData),
                    BirthPlace(generalData),
                    Address(generalData),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Political extends StatelessWidget {
  final GeneralData data;
  const Political(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      //margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      child: Column(children: [
        const Text(
          "Organización Política por la que Postula:",
          textAlign: TextAlign.justify,
        ),
        Text(
          textAlign: TextAlign.center,
          data.organizacionPolitica,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Cargo al que Postula:"),
        Text(
          textAlign: TextAlign.center,
          data.cargo![0],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Circunscripción Según el Cargo al que Postula",
          textAlign: TextAlign.justify,
        ),
        const Text(
          "Distrito electoral:",
          textAlign: TextAlign.justify,
        ),
        Text(
          textAlign: TextAlign.center,
          "${data.postulaDepartamento} /${data.postulaProvincia} /${data.postulaDistrito}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}

class Info extends StatelessWidget {
  final GeneralData data;
  const Info(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final newDate = DateFormat('dd/MM/yyyy').parse(data.feNacimiento);
    String years = (now.difference(newDate).inDays ~/ 365).toString();
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      child: Column(
        children: [
          const Text("DNI:"),
          Text(
            textAlign: TextAlign.justify,
            data.numeroDocumento,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("SEXO:"),
          Text(
            textAlign: TextAlign.justify,
            data.sexo == "1" ? "MASCULINO" : "FEMENINO",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Apellido Paterno:"),
          Text(
            textAlign: TextAlign.justify,
            data.apellidoPaterno,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Apellido Materno:"),
          Text(
            data.apellidoMaterno,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Nombres:"),
          Text(
            data.nombres,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Fecha de Nacimiento:"),
          Text(
            "${data.feNacimiento} . $years años",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BirthPlace extends StatelessWidget {
  final GeneralData data;
  const BirthPlace(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
        color: Colors.limeAccent,
      ),
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      child: Column(
        children: [
          const Text(
            "LUGAR DE NACIMIENTO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Text("Pais"),
          Text(
            data.paisNacimiento,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "DEPARTAMENTO / PROVINCIA / DISTRITO:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${data.naciDepartamento} - ${data.naciProvincia} - ${data.naciDistrito}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Address extends StatelessWidget {
  final GeneralData data;
  const Address(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
        color: Colors.greenAccent,
      ),
      padding: const EdgeInsets.all(10.0),
      width: double.maxFinite,
      child: Column(
        children: [
          const Text(
            "LUGAR DE DOMICILIO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Text(
            "DEPARTAMENTO / PROVINCIA / DISTRITO:",
            textAlign: TextAlign.justify,
          ),
          Text(
            "${data.naciDepartamento} - ${data.naciProvincia} - ${data.naciDistrito}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Dirección:"),
          Text(
            data.domicilioDirecc,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
