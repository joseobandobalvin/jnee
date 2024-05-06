import 'package:jnee/models/income.dart';
import 'package:jnee/models/inmovable_property.dart';
import 'package:jnee/models/movable_property.dart';
import 'package:jnee/models/ownership.dart';
import 'package:jnee/screens/detail/widgets/detail_sworn_declarationx.dart';

class SwornDeclaration {
  List<Income> ingreso;
  List<InmovableProperty> bienInmueble;
  List<MovableProperty> bienMueble;
  List<Ownership> titularidad;

  SwornDeclaration({
    required this.ingreso,
    required this.bienInmueble,
    required this.bienMueble,
    required this.titularidad,
  });

  factory SwornDeclaration.fromJson(Map<String, dynamic> json) {
    var list = json['ingreso'] as List;
    var list2 = json['bienInmueble'] as List;
    var list3 = json['bienMueble'] as List;
    var list4 = json['titularidad'] as List;

    List<Income> ingresoList = list.map((i) => Income.fromJson(i)).toList();
    List<InmovableProperty> inmuebleList =
        list2.map((i) => InmovableProperty.fromJson(i)).toList();
    List<MovableProperty> muebleList =
        list3.map((i) => MovableProperty.fromJson(i)).toList();
    List<Ownership> titularidadList =
        list4.map((i) => Ownership.fromJson(i)).toList();

    return SwornDeclaration(
      ingreso: ingresoList,
      bienInmueble: inmuebleList,
      bienMueble: muebleList,
      titularidad: titularidadList,
    );
  }
}
