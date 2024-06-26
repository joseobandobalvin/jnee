import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/academic_formation.dart';
import 'package:jnee/models/basic_education.dart';
import 'package:jnee/models/posgrade_education.dart';
import 'package:jnee/models/technical_education.dart';
import 'package:jnee/models/university_education.dart';

class DetailAcademicFormation extends StatelessWidget {
  final AcademicFormation academicFormation;
  const DetailAcademicFormation(this.academicFormation, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 40.0,
        color: kDarkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const Icon(Icons.school_outlined),
            Text(
              ' Formación académica (${academicFormation.educacionTecnico.length + academicFormation.educacionUniversitaria.length + academicFormation.educacionPosgrado.length})',
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Basic(academicFormation.educacionBasica),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS TECNICOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Technical(academicFormation.educacionTecnico),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS UNIVERSITARIOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            University(academicFormation.educacionUniversitaria),
            Container(
              color: Colors.teal,
              child: const Center(
                  child: Text(
                "ESTUDIOS POSGRADO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Posgrade(academicFormation.educacionPosgrado),
          ],
        ),
      ),
    );
  }
}

class Basic extends StatelessWidget {
  final BasicEducation data;
  const Basic(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(4.0),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("¿ESTUDIOS PRIMARIOS?"),
                    Text(
                      "${data.eduPrimaria}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("¿PRIMARIOS CONCLUIDOS?"),
                    Text(
                      "${data.concluidoEduPrimaria}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("¿ESTUDIOS SECUNDARIOS?"),
                    Text(
                      "${data.eduSecundaria}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("¿SECUNDARIOS CONCLUIDOS?"),
                    Text(
                      "${data.concluidoEduSecundaria}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Technical extends StatelessWidget {
  final List<TechnicalEducation> data;
  const Technical(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${data[index].cenEstudioTecnico}",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${data[index].carreraTecnico}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${data[index].estado}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CONCLUIDOS"),
                                  Text(
                                    "${data[index].concluidoEduTecnico}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios tecnicos"),
          );
  }
}

class University extends StatelessWidget {
  final List<UniversityEducation> data;
  const University(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SizedBox(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${data[index].universidad}",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${data[index].carreraUni}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Año : ${data[index].anioBachiller}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CONCLUIDOS"),
                                  Text(
                                    "${data[index].concluidoEduUni}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("EGRESADO"),
                                  Text(
                                    "${data[index].egresadoEduUni}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios universitarios"),
          );
  }
}

class Posgrade extends StatelessWidget {
  final List<PosgradeEducation> data;
  const Posgrade(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.red,
                    width: 370,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "${data[index].txCenEstudioPosgrado}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txEspecialidadPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txAnioPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("CONCLUIDOS"),
                                  Text(
                                    "${data[index].concluidoPosgrado}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text("EGRESADO"),
                                  Text(
                                    "${data[index].egresadoPosgrado}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        : Container(
            margin: const EdgeInsets.all(10.0),
            child: const Text("No registra estudios de Posgrado"),
          );
  }
}
