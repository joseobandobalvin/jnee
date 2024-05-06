import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jnee/helpers/platform_exceptions.dart';
import 'package:jnee/models/cv.dart';
import 'package:jnee/models/user.dart';
import 'package:jnee/providers/remote/user_provider.dart';
import 'package:jnee/widgets/global_widgets/loader.dart';

class HomeController extends GetxController {
  final UserProvider _userProvider = UserProvider();

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Cv>> getCandidates() async {
    List<Cv> usuarios = [];

    try {
      final res =
          await _userProvider.getAllCandidates().timeout(Duration(seconds: 2));

      if (res != null && res["count"] > 0.0) {
        final lista = List.from(res['data']);
        for (var e in lista) {
          final Cv user = Cv.fromJson(e);
          usuarios.add(user);
        }
        return usuarios;
      }
    } on PlatformException catch (e) {
      print("error de PlatformException flutter getCandidates-----");
      throw OPlatformException(e.code).message;
    } catch (e) {
      print("error sin manejadores en flutter getCandidates ----");
      print(e.hashCode);
    }

    return usuarios;
  }

  Future<List<Cv>> getCandidatesByName(query) async {
    List<Cv> usuarios = [];

    try {
      final res = await _userProvider.getAllCandidatesByName(query);
      if (res != null && res["count"] > 0.0) {
        final lista = List.from(res['data']);
        for (var e in lista) {
          final Cv user = Cv.fromJson(e);
          usuarios.add(user);
        }
        return usuarios;
      }
    } on PlatformException catch (e) {
      print("error de PlatformException flutter getCandidatesByName-----");
      throw OPlatformException(e.code).message;
    } catch (e) {
      print("error sin manejadores en flutter getCandidatesByName ----");
      print(e.runtimeType);
      Loader.errorSnackBar(title: "Error", message: e.toString());
    }

    return usuarios;
  }

  Future<User> getUserInformation(idHojaVida) async {
    dynamic res = await _userProvider.getUserInformation(idHojaVida);
    User user = User.fromJson(res);

    // dynamic res;
    // User user;
    // try {
    //   res = await _userProvider.getUserInformation(idHojaVida);
    //   user = User.fromJson(res);
    //   return user;
    // } catch (e) {}
    return user;
  }
}
