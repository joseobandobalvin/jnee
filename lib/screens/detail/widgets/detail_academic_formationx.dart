import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/models/academic_formation.dart';
import 'package:jnee/models/basic_education.dart';
import 'package:jnee/models/posgrade_education.dart';
import 'package:jnee/models/technical_education.dart';
import 'package:jnee/models/university_education.dart';

class DetailAcademicFormationX extends StatelessWidget {
  final AcademicFormation academicFormation;
  const DetailAcademicFormationX(this.academicFormation, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>("academic"),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "EDUCACIÓN BÁSICA REGULAR",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Basic(academicFormation.educacionBasica),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "ESTUDIOS NO UNIVERSITARIOS",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Container(
                      width: double.maxFinite,
                      color: Colors.teal,
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Estudios técnicos",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Technical(academicFormation.educacionTecnico),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "ESTUDIOS UNIVERSITARIOS",
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    University(academicFormation.educacionUniversitaria),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: kDarkBlue,
                      child: const Center(
                          child: Text(
                        "ESTUDIOS POSGRADO",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Posgrade(academicFormation.educacionPosgrado),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    //   return SliverStickyHeader(

    //     sliver: SliverToBoxAdapter(
    //       child: Column(
    //         children: [
    //           Basic(academicFormation.educacionBasica),
    //           Container(
    //             color: Colors.teal,
    //             child: const Center(
    //                 child: Text(
    //               "ESTUDIOS TECNICOS",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             )),
    //           ),
    //           Technical(academicFormation.educacionTecnico),
    //           Container(
    //             color: Colors.teal,
    //             child: const Center(
    //                 child: Text(
    //               "ESTUDIOS UNIVERSITARIOS",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             )),
    //           ),
    //           University(academicFormation.educacionUniversitaria),
    //           Container(
    //             color: Colors.teal,
    //             child: const Center(
    //                 child: Text(
    //               "ESTUDIOS POSGRADO",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             )),
    //           ),
    //           Posgrade(academicFormation.educacionPosgrado),
    //         ],
    //       ),
    //     ),
    //   );
    // }
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
                    const Text(
                      "¿Cuenta con estudios primarios?",
                      textAlign: TextAlign.center,
                    ),
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
                    const Text(
                      "¿Estudios primarios concluidos?",
                      textAlign: TextAlign.center,
                    ),
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
                    const Text(
                      "¿Cuenta con estudios secundarios?",
                      textAlign: TextAlign.center,
                    ),
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
                    const Text(
                      "¿Estudios secundarios concluidos?",
                      textAlign: TextAlign.center,
                    ),
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
            height: 230,
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

class NoUniversity extends StatelessWidget {
  final List<TechnicalEducation> data;
  const NoUniversity(this.data, {super.key});

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
            height: 230,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
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
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${data[index].carreraUni}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${data[index].anioBachiller}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
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
                                  const Text(
                                    "CONCLUIDOS",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
                                  const Text(
                                    "EGRESADO",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
            height: 230,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.lightBlueAccent,
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
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txEspecialidadPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${data[index].txAnioPosgrado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
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
                                  const Text(
                                    "CONCLUIDOS",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
                                  const Text(
                                    "EGRESADO",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
