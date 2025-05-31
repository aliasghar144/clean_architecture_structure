
import 'package:hamrah_amozeshgah/core/enums/request_status_enum.dart';
class Status<T> {
  const Status({
    this.status = RequestStatus.initial,
    this.data,
    this.errorMessage,
  });

  final RequestStatus status;
  final T? data;
  final String? errorMessage;
}