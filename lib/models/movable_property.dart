class MovableProperty {
  final int idHvBienMueble, itemMueble, idHojaVida, idEstado;
  final double? valor;

  final String? idTengoBienMueble,
      tengoBienMueble,
      vehiculo,
      marca,
      placa,
      modelo,
      anio,
      caracteristica,
      comentario;

  MovableProperty({
    required this.idHvBienMueble,
    required this.itemMueble,
    required this.idHojaVida,
    required this.idEstado,
    this.valor,
    this.idTengoBienMueble,
    this.tengoBienMueble,
    this.vehiculo,
    this.marca,
    this.placa,
    this.modelo,
    this.anio,
    this.caracteristica,
    this.comentario,
  });

  factory MovableProperty.fromJson(Map<String, dynamic> json) {
    return MovableProperty(
      idHvBienMueble: json['idHvBienMueble'],
      itemMueble: json['itemMueble'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      valor: json['valor'],
      idTengoBienMueble: json['idTengoBienMueble'],
      tengoBienMueble: json['tengoBienMueble'],
      vehiculo: json['vehiculo'],
      marca: json['marca'],
      placa: json['placa'],
      modelo: json['modelo'],
      anio: json['anio'],
      caracteristica: json['caracteristica'],
      comentario: json['comentario'],
    );
  }
}
