import 'package:dio/dio.dart';
import 'package:simple/models/response/loginresponse_model.dart';
import 'package:simple/modules/app_localizations.dart';
import 'package:simple/services/user_service.dart';
import 'package:simple/stores/base/base_store.dart';
import 'package:mobx/mobx.dart';
import 'package:simple/utils/dio/dio_error_util.dart';
import 'package:validators/validators.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore extends BaseStore with Store {
  // store for handling form errors
  final LoginErrorStore loginErrorStore = LoginErrorStore();
  final UserService _userService = UserService();

  _LoginStore() {
    _setupValidations();
  }

  List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userMobile, validateUserMobile),
      reaction((_) => password, validatePassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userMobile = '';

  @observable
  String password = '';

  bool isLoggedOut = false;

  bool isLoggedIn = false;

  bool shouldLogOut = false;

  @computed
  bool get canLogin =>
      !loginErrorStore.hasErrorsInLogin &&
      userMobile.isNotEmpty &&
      password.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserMobile(String value) {
    userMobile = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void validateUserMobile(String value) {
    if (value.isEmpty) {
      loginErrorStore.userMobile =
          AppLocalizations.instance.text('validation.mobile.not.empty');
    } else if (!isNumeric(value)) {
      loginErrorStore.userMobile =
          AppLocalizations.instance.text('validation.mobile.invalid');
    } else if (value.length < 10) {
      loginErrorStore.userMobile =
          AppLocalizations.instance.text('validation.mobile.not.minlength');
    } else {
      loginErrorStore.userMobile = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      loginErrorStore.password =
          AppLocalizations.instance.text('validation.password.not.empty');
    } else if (value.length < 5) {
      loginErrorStore.password =
          AppLocalizations.instance.text('validation.password.6.chars');
    } else {
      loginErrorStore.password = null;
    }
  }

  @action
  Future login() async {
    loading = true;

    try {
      final future = ObservableFuture(_userService.doLogin());

      future.then((LoginResponse loginResponse) {
        loading = false;
        success = true;
        isLoggedIn = true;
        errorStore.showError = false;
      }).catchError((error) {
        loading = false;
        isLoggedIn = false;
        success = false;
        errorStore.showError = true;
        errorStore.errorMessage = DioErrorUtil.handleError(error);
      });
    } on DioError catch (e) {
      print(e);
      loading = false;
      success = false;
      isLoggedIn = false;
      errorStore.showError = true;
      errorStore.errorMessage =
          AppLocalizations.instance.text('validation.invalid.login');
      return null;
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserMobile(userMobile);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {
  @observable
  String userMobile;

  @observable
  String password;

  @computed
  bool get hasErrorsInLogin => userMobile != null || password != null;
}
