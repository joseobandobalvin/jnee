import 'package:jnee/generated/l10n.dart';
import 'package:jnee/helpers/http.dart';
import 'package:jnee/helpers/http_method.dart';

class HearingProvider {
  final Http _http = Http();

  Future getList() async {
    try {
      final response = await _http.request(
        S.current.urlPublicHearing,
        method: HttpMethod.post,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "mDataProp_0": "txFecha",
          "mDataProp_1": "txHora",
          "mDataProp_2": "txComentario",
          "mDataProp_3": "txArchivo",
          "mDataProp_4": "txHojaVotacion",
          "mDataProp_5": "urlVideo",
          "iColumns": "6",
          "iDisplayStart": "0",
          "iDisplayLength": "10",
          "sSortDir_0": "desc",
          "sEcho": "1"
        },
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
