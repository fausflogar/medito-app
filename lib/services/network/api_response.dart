/*This file is part of Medito App.

Medito App is free software: you can redistribute it and/or modify
it under the terms of the Affero GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Medito App is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
Affero GNU General Public License for more details.

You should have received a copy of the Affero GNU General Public License
along with Medito App. If not, see <https://www.gnu.org/licenses/>.*/

import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  final Status status;
  final T? body;
  final String? message;
  final int? statusCode;

  ApiResponse.loading()
      : status = Status.LOADING,
        body = null,
        statusCode = null,
        message = '';
  ApiResponse.completed(this.body)
      : status = Status.COMPLETED,
        statusCode = null,
        message = '';
  ApiResponse.error(
    String? message,
  )   : status = Status.ERROR,
        message = message?.split(',').first,
        statusCode = message?.split(',').last != null
            ? int.parse(message!.split(',').last)
            : null,
        body = null;

  bool hasData() {
    return status != Status.LOADING && body != null;
  }

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $body';
  }

  @override
  List<Object?> get props => [status, body, message];
}

enum Status { LOADING, COMPLETED, ERROR }
