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
  // final OrganizationProvider _orgProvider = OrganizationProvider();

  // Future<List<Organization>> getListByDepartmentAndOrganization() async {
  //   final res = await _orgProvider.getListByDepartmentAndOrganization();
  //   List<Organization> organizations = [];

  //   if (res != null) {
  //     final lista = List.from(res['data']);
  //     for (var e in lista) {
  //       final Organization user = Organization.fromJson(e);
  //       organizations.add(user);
  //     }
  //     return organizations;
  //   }

  //   return organizations;
  // }

  Future<List<Hearing>> getList(BuildContext c) async {
    List<Hearing> hearings = [];
    try {
      final res = await _hearingProvider.getList();

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
      SnackBars.show(c, error: e);
      print(e);
    }
    return hearings;
  }
}
