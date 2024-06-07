import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jnee/helpers/platform_exceptions.dart';
import 'package:jnee/models/hearing/hearing.dart';
import 'package:jnee/providers/remote/hearing_provider.dart';
import 'package:jnee/widgets/dialogs.dart';
//import 'package:jnee/models/organization.dart';
//import 'package:jnee/providers/remote/organization_provider.dart';

class HearingController extends GetxController {
  final HearingProvider _hearingProvider = HearingProvider();
  RxString sortDir = "asc".obs;
  RxInt disLen = 10.obs;

  String get sortDirection => sortDir.value;
  int get dispalyLength => disLen.value;

  set sortDirection(String dir) {
    sortDir.value = dir;
  }

  set dispalyLength(int len) {
    disLen.value = len;
  }

  Future<List<Hearing>> getList(BuildContext c,
      {int displayStart = 0,
      int displayLength = 10,
      String sortDir = "desc"}) async {
    List<Hearing> hearings = [];
    try {
      final res =
          await _hearingProvider.getList(displayStart, displayLength, sortDir);

      if (res != null && res['sEcho'] == "1") {
        final lista = List.from(res['aaData']);

        for (var e in lista) {
          final Hearing h = Hearing.fromJson(e);
          hearings.add(h);
        }

        return hearings;
      }
    } on PlatformException catch (e) {
      print(
          "error de PlatformException flutter HearingController getList-----");
      throw OPlatformException(e.code).message;
    } catch (e) {
      print("error sin manejadores en flutter HearingController getList ----");
      // ignore: use_build_context_synchronously
      Get.snackbar("title", "message");
      SnackBars.show(c, error: e);
      print(e);
    }
    return hearings;
  }
}
