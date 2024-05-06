import 'package:jnee/models/cv.dart';
import 'package:jnee/providers/remote/account_provider.dart';
import 'package:jnee/repo/account_repo.dart';

class AccountRepoImp implements AccountRepo {
  final AccountProvider _provider = AccountProvider();

  //AccountRepoImp(this._provider);

  @override
  Future<Cv?> get userInformation => _provider.userInformation;
}
