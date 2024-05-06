import 'package:jnee/models/academic_formation.dart';
import 'package:jnee/models/aditional_information.dart';
import 'package:jnee/models/general_data.dart';

import 'package:jnee/models/sentence.dart';
import 'package:jnee/models/sworn_declaration.dart';
import 'package:jnee/models/trajectory.dart';
import 'package:jnee/models/work_experience.dart';

class User {
  final GeneralData datoGeneral;
  final List<WorkExperience> experienciaLaboral;
  final AcademicFormation formacionAcademica;
  final Trajectory trayectoria;
  final SwornDeclaration declaracionJurada;
  final List<AditionalInformation> informacionAdicional;
  final List<Sentence> sentenciaPenal;

  User({
    required this.datoGeneral,
    required this.experienciaLaboral,
    required this.formacionAcademica,
    required this.trayectoria,
    required this.declaracionJurada,
    required this.informacionAdicional,
    required this.sentenciaPenal,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['experienciaLaboral'] as List;
    var list2 = json['informacionAdicional'] as List;
    var list3 = json['sentenciaPenal'] as List;

    List<WorkExperience> workExperienceList =
        list.map((i) => WorkExperience.fromJson(i)).toList();
    List<AditionalInformation> aditionalInformationList =
        list2.map((i) => AditionalInformation.fromJson(i)).toList();
    List<Sentence> sentenceList =
        list3.map((i) => Sentence.fromJson(i)).toList();

    return User(
      datoGeneral: GeneralData.fromJson(json["datoGeneral"]),
      experienciaLaboral: workExperienceList,
      formacionAcademica:
          AcademicFormation.fromJson(json["formacionAcademica"]),
      trayectoria: Trajectory.fromJson(json["trayectoria"]),
      declaracionJurada: SwornDeclaration.fromJson(json["declaracionJurada"]),
      informacionAdicional: aditionalInformationList,
      sentenciaPenal: sentenceList,
    );
  }
}
