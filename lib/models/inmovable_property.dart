class InmovableProperty {
  final int idHvBienInmueble, itemInmueble, idHojaVida, idEstado;
  final double? autovaluo;

  final String? idTengoinmueble,
      tengoInmueble,
      tipoBienInmueble,
      ubigeoInmueble,
      inmueblePais,
      inmuebleDepartamento,
      inmuebleProvincia,
      inmuebleDistrito,
      inmuebleDireccion,
      comentario,
      inmuebleSunarp,
      inmuebleSunarpDesc,
      partidaSunarp,
      fichaTomoSunarp,
      flValor;

  InmovableProperty({
    required this.idHvBienInmueble,
    required this.itemInmueble,
    required this.idHojaVida,
    required this.idEstado,
    this.autovaluo,
    this.idTengoinmueble,
    this.tengoInmueble,
    this.tipoBienInmueble,
    this.ubigeoInmueble,
    this.inmueblePais,
    this.inmuebleDepartamento,
    this.inmuebleProvincia,
    this.inmuebleDistrito,
    this.inmuebleDireccion,
    this.comentario,
    this.inmuebleSunarp,
    this.inmuebleSunarpDesc,
    this.partidaSunarp,
    this.fichaTomoSunarp,
    this.flValor,
  });

  factory InmovableProperty.fromJson(Map<String, dynamic> json) {
    return InmovableProperty(
      idHvBienInmueble: json['idHvBienInmueble'],
      itemInmueble: json['itemInmueble'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      autovaluo: json['autovaluo'],
      idTengoinmueble: json['idTengoinmueble'],
      tengoInmueble: json['tengoInmueble'],
      tipoBienInmueble: json['tipoBienInmueble'],
      ubigeoInmueble: json['ubigeoInmueble'],
      inmueblePais: json['inmueblePais'],
      inmuebleDepartamento: json['inmuebleDepartamento'],
      inmuebleProvincia: json['inmuebleProvincia'],
      inmuebleDistrito: json['inmuebleDistrito'],
      inmuebleDireccion: json['inmuebleDireccion'],
      comentario: json['comentario'],
      inmuebleSunarp: json['inmuebleSunarp'],
      inmuebleSunarpDesc: json['inmuebleSunarpDesc'],
      partidaSunarp: json['partidaSunarp'],
      fichaTomoSunarp: json['fichaTomoSunarp'],
      flValor: json['flValor'],
    );
  }
}
