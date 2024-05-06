class AditionalInformation {
  final int idHvInfoAdicional, idEstado, idHojaVida;

  final String? idTengoInfoAdicional, tengoInfoAdicional, infoAdicional;

  AditionalInformation({
    required this.idHvInfoAdicional,
    required this.idEstado,
    required this.idHojaVida,
    this.idTengoInfoAdicional,
    this.tengoInfoAdicional,
    this.infoAdicional,
  });

  factory AditionalInformation.fromJson(Map<String, dynamic> json) {
    return AditionalInformation(
      idHvInfoAdicional: json['idHvInfoAdicional'],
      idEstado: json['idEstado'],
      idHojaVida: json['idHojaVida'],
      idTengoInfoAdicional: json['idTengoInfoAdicional'],
      tengoInfoAdicional: json['tengoInfoAdicional'],
      infoAdicional: json['infoAdicional'],
    );
  }
}
