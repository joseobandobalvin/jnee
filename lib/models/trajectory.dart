import 'package:jnee/models/elective_position.dart';
import 'package:jnee/models/partial_position.dart';

class Trajectory {
  List<ElectivePosition> cargoEleccion;
  List<PartialPosition> cargoPartidario;

  Trajectory({
    required this.cargoEleccion,
    required this.cargoPartidario,
  });

  factory Trajectory.fromJson(Map<String, dynamic> json) {
    var list = json['cargoEleccion'] as List;
    var list2 = json['cargoPartidario'] as List;

    List<ElectivePosition> cargoEleccionList =
        list.map((i) => ElectivePosition.fromJson(i)).toList();

    List<PartialPosition> cargoPartidarioList =
        list2.map((i) => PartialPosition.fromJson(i)).toList();

    return Trajectory(
      cargoEleccion: cargoEleccionList,
      cargoPartidario: cargoPartidarioList,
    );
  }
}
