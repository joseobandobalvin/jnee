class Sentence {
  final int idHvSentenciaPenal,
      nuItemSentenciaPenal,
      idParamModalidad,
      idParamCumpleFallo,
      idEstado,
      idHojaVida;

  final String? tengoSentenciaPenal,
      txExpedientePenal,
      feSentenciaPenal,
      txOrganoJudiPenal,
      txDelitoPenal,
      txFalloPenal,
      txModalidad,
      txOtraModalidad,
      txCumpleFallo,
      txComentario;

  Sentence({
    required this.idHvSentenciaPenal,
    required this.nuItemSentenciaPenal,
    required this.idParamModalidad,
    required this.idParamCumpleFallo,
    required this.idEstado,
    required this.idHojaVida,
    this.tengoSentenciaPenal,
    this.txExpedientePenal,
    this.feSentenciaPenal,
    this.txOrganoJudiPenal,
    this.txDelitoPenal,
    this.txFalloPenal,
    this.txModalidad,
    this.txOtraModalidad,
    this.txCumpleFallo,
    this.txComentario,
  });

  factory Sentence.fromJson(Map<String, dynamic> json) {
    return Sentence(
      idHvSentenciaPenal: json['idHvSentenciaPenal'],
      nuItemSentenciaPenal: json['nuItemSentenciaPenal'],
      idParamModalidad: json['idParamModalidad'],
      idParamCumpleFallo: json['idParamCumpleFallo'],
      idEstado: json['idEstado'],
      idHojaVida: json['idHojaVida'],
      tengoSentenciaPenal: json['tengoSentenciaPenal'],
      txExpedientePenal: json['txExpedientePenal'],
      feSentenciaPenal: json['feSentenciaPenal'],
      txOrganoJudiPenal: json['txOrganoJudiPenal'],
      txDelitoPenal: json['txDelitoPenal'],
      txFalloPenal: json['txFalloPenal'],
      txModalidad: json['txModalidad'],
      txOtraModalidad: json['txOtraModalidad'],
      txCumpleFallo: json['txCumpleFallo'],
      txComentario: json['txComentario'],
    );
  }
}
