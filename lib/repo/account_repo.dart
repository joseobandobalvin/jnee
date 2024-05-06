import 'package:jnee/models/cv.dart';

abstract class AccountRepo {
  Future<Cv?> get userInformation;
}
