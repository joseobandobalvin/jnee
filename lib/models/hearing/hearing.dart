class Hearing {
  final int? idAudiencia, idusuario;
  final String? txFecha,
      txHora,
      txFechaEdit,
      txArchivoEdit,
      feregistro,
      txComentario,
      txFechaSort,
      txHojaVotacion,
      urlVideo;
  final String txArchivo;

  Hearing(
      {this.idAudiencia,
      this.idusuario,
      this.txFecha,
      this.txHora,
      required this.txArchivo,
      this.txFechaEdit,
      this.txArchivoEdit,
      this.feregistro,
      this.txComentario,
      this.txFechaSort,
      this.txHojaVotacion,
      this.urlVideo});

  factory Hearing.fromJson(Map<String, dynamic> json) {
    return Hearing(
      idAudiencia: json['idAudiencia'],
      txFecha: json['txFecha'],
      txHora: json['txHora'],
      txArchivo: json['txArchivo'],
      txFechaEdit: json['txFechaEdit'],
      txArchivoEdit: json['txArchivoEdit'],
      feregistro: json['feregistro'],
      txComentario: json['txComentario'],
      idusuario: json['idusuario'],
      txFechaSort: json['txFechaSort'],
      txHojaVotacion: json['txHojaVotacion'],
      urlVideo: json['urlVideo'],
    );
  }
}
