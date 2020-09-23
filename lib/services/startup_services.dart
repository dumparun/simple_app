import 'package:simple/constants/local_data.dart';
import 'package:simple/services/base_services.dart';

class StartupService extends BaseService {
  StartupService() : super();

  Future<bool> doesTokenExist() async {
    int count = await this.dataSource.countUserdata();

    if (count > 0) {
      return await this.dataSource.getAuthData().then((authData) {
        print("CAlled Does Token Exist");
        if (authData != null && authData.accessToken != null) {
          var now = new DateTime.now();
          var expires = authData.lastLoggedInTime
              .add(Duration(seconds: authData.expiresIn));
          print("Checking token expiry");

          if (now.isBefore(expires)) {
            LocalData().accessToken = authData.accessToken;
            LocalData().refreshToken = authData.refreshToken;
            LocalData().csrfToken = authData.csrfToken;
            LocalData().userId = authData.userId;
            LocalData().loginId = authData.loginId;
            return true;
          } else {
            this.dataSource.deleteAuthData();
            return false;
          }
        } else {
          return false;
        }
      }).catchError((error) {
        return false;
      });
    } else {
      return false;
    }
  }
}
