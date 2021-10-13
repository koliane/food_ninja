import 'event_listener.dart';
import 'event.dart';

class OneTypeEvents<T extends EventListener>{

  final List<T> _listeners = [];

  List<T> get listeners => _listeners;

  bool addListener(covariant T listener) {
    if(listener.ignoreIfTypeExists) {
      final bool isExists = _listeners.any(
          (element) => element.runtimeType.toString() == listener.runtimeType.toString()
      );
      if(isExists) {
        return false;
      }
    }
    _listeners.add(listener);

    return true;
  }

  void removeListener(covariant T listener) {
    _listeners.removeWhere((element) => element == listener);
  }

  // Отсортируем по приорететам
  void _sortListeners() {
    _listeners.sort((a, b) => b.priority - a.priority);
  }

  void _removeOneTimeListeners() {
    // удалим одноразовых слушателей
    _listeners.removeWhere((element) => !element.isPersistent);
  }

  void exec(covariant Event event) {
    _sortListeners();

    for(int i = 0; i< _listeners.length; i++) {
      final EventListener item = _listeners[i];
      try {
        item.exec(event);
      } on Exception {
        _removeOneTimeListeners();
        rethrow;
      }
    }
    _removeOneTimeListeners();
  }
}