import './loading_status_enum.dart';
import './process_status.dart';

class LoadingProcessStatus extends ProcessStatus {
  LoadingStatusEnum _status = LoadingStatusEnum.waiting;

  LoadingStatusEnum get status => _status;

  bool get isWaiting => _status == LoadingStatusEnum.waiting;
  bool get isLoading => _status == LoadingStatusEnum.loading;
  bool get isSuccess => _status == LoadingStatusEnum.success;
  bool get isError => _status == LoadingStatusEnum.error;
  bool get isFinished => _status == LoadingStatusEnum.success || _status == LoadingStatusEnum.error;


  void changeStatusToWaiting() {
    _status = LoadingStatusEnum.waiting;
  }

  void changeStatusToLoading() {
    _status = LoadingStatusEnum.loading;
  }

  void changeStatusToSuccess() {
    _status = LoadingStatusEnum.success;
  }

  void changeStatusToError() {
    _status = LoadingStatusEnum.error;
  }
}