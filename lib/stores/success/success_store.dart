import 'package:mobx/mobx.dart';

part 'success_store.g.dart';

class SuccessStore = _SuccessStore with _$SuccessStore;

abstract class _SuccessStore with Store {
  // store variables:-----------------------------------------------------------
  @observable
  String successMessage;
}
