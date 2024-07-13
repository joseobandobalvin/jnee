import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jnee/helpers/platform_exceptions.dart';
import 'package:jnee/models/parliament/parliament.dart';
import 'package:jnee/providers/remote/parliament_provider.dart';
import 'package:jnee/widgets/global_widgets/loader.dart';

//import 'package:jnee/models/organization.dart';
//import 'package:jnee/providers/remote/organization_provider.dart';

class ParliamentController extends GetxController {
  final ParliamentProvider _parliamentProvider = ParliamentProvider();

  Future<List<Parliament>> getParliaments(BuildContext context) async {
    List<Parliament> parliaments = [];

    try {
      final res = await _parliamentProvider.getAllParliaments();
      //.timeout(const Duration(milliseconds: 2));

      if (res != null && res["success"] == true) {
        final lista = List.from(res['data']['lbeConformacion']);
        //print(res['data']['lbeConformacion']);
        for (var e in lista) {
          final Parliament parliament = Parliament.fromJson(e);
          parliaments.add(parliament);
        }
        return parliaments;
      }
    } on PlatformException catch (e) {
      print("error de PlatformException flutter getParliaments-----");
      throw OPlatformException(e.code).message;
    } catch (e) {
      print("error sin manejadores en flutter getParliaments ----");
      print(e);

      Loader.snackBarFlutter(context, message: e.toString());
      //Loader.errorSnackBar(title: "Errorrrrr", message: e.toString());
    }

    return parliaments;
  }
}
