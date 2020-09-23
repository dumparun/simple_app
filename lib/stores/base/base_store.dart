/*
	 *************************************************************************************************************************************
	 *                                                                                                                                    *
	 * Copyright (c) 2013-2020 Minebrat Private Limited
	 * =================================================                                                                                  *
	 *                                                                                                                                    *
	 * Licensed under The MIT-Zero License                                                                                                *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software                                      *
	 * and associated documentation files (the "Software"), to deal in the Software without restriction,                                  *
	 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,                              *
	 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.                              *
	 *                                                                                                                                    *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED                      *
	 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL                      *
	 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,            *
	 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.           *
	 *                                                                                                                                    *
	 *                                                                                                                                    *
	 * @author Minebrat Private Limited                                                                                                                   *
	 * @license MIT-Zero License                                                                                                          *
	 * @version 2.0.0                                                                                                                     *
	 *                                                                                                                                    *
	 **************************************************************************************************************************************
	 */
import 'package:flutter/material.dart';
import 'package:simple/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:simple/stores/success/success_store.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  final SuccessStore successStore = SuccessStore();

  BuildContext context;

  _BaseStore() {
    _setupValidations();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void _setupValidations() {}

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  bool absorbPointer = false;

  @action
  void setAbsorbPointer(bool absorb) {
    absorbPointer = absorb;
  }
}
