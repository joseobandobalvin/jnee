import 'package:jnee/generated/l10n.dart';
import 'package:jnee/helpers/http.dart';
import 'package:jnee/helpers/http_method.dart';

class ParliamentProvider {
  final Http _http = Http();

  Future getAllParliaments() async {
    try {
      final response = await _http.request(
        S.current.urlAndeanParliament,
        method: HttpMethod.post,
        body: {
          'idTipoEleccion': 3,
          'strUbigeo': "000000",
        },
      );
      //print(response.data);
      return response.data;
    } catch (e) {
      //print("error sin manejadores en flutter getallcandidates ----");
      return null;
    }
  }
}
