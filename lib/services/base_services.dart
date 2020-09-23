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
import 'package:simple/data/datasource.dart';
import 'package:simple/data/network/dio_client.dart';
import 'package:simple/data/sharedpref/shared_preference_helper.dart';
import 'package:simple/modules/local_module.dart';
import 'package:simple/modules/netwok_module.dart';
import 'package:dio/dio.dart';

class BaseService {
  DioClient dioClient;
  DataSource dataSource;
  SharedPreferenceHelper sharedPrefsHelper;

  BaseService() {
    this.dioClient = new NetworkModule().provideDioClient(new Dio());
    this.dataSource = new LocalModule().provideDataSource();
  }
}
