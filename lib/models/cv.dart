class Cv {
  final String? estado,
      nombreCompleto,
      numeroDocumento,
      organizacionPolitica,
      rutaArchivo;
  final String? postulaDepartamento, postulaDistrito, postulaProvincia;
  final int? rowNumber;
  final double? idOrganizacionPolitica, numeroCandidato, idHojaVida;

  Cv({
    this.estado,
    this.nombreCompleto,
    this.organizacionPolitica,
    this.postulaDepartamento,
    this.postulaDistrito,
    this.postulaProvincia,
    this.rutaArchivo,
    this.idHojaVida,
    this.idOrganizacionPolitica,
    this.numeroCandidato,
    this.numeroDocumento,
    this.rowNumber,
  });

  factory Cv.fromJson(Map<String, dynamic> json) {
    return Cv(
        estado: json['estado'],
        nombreCompleto: json['nombreCompleto'],
        organizacionPolitica: json['organizacionPolitica'],
        postulaDepartamento: json['postulaDepartamento'],
        postulaDistrito: json['postulaDistrito'],
        postulaProvincia: json['postulaProvincia'],
        rutaArchivo: json['rutaArchivo'],
        idHojaVida: json['idHojaVida'],
        idOrganizacionPolitica: json['idOrganizacionPolitica'],
        numeroCandidato: json['numeroCandidato'],
        numeroDocumento: json['numeroDocumento'],
        rowNumber: json['rowNumber']);
  }
}
