import 'event.dart';
import 'event_listener.dart';
import 'one_type_events.dart';

class EventDispatcher {
  // Ключ - тип класса события
  final Map<String, OneTypeEvents> _listenersMap = {  };

  void addListener(Type event, covariant EventListener listener) {
    final String eventKey = event.toString();
    final bool existsEventType =  _listenersMap.containsKey(eventKey);

    if(!existsEventType) {
      _listenersMap[eventKey] = OneTypeEvents();
    }
    _listenersMap[eventKey]!.addListener(listener);
  }

  // void removeListener(covariant Event event, covariant EventListener listener) {
  void removeListener(Type event, covariant EventListener listener) {
    final String eventKey = event.toString();
    final bool existsEventType =  _listenersMap.containsKey(eventKey);

    if(existsEventType) {
      _listenersMap[eventKey]!.removeListener(listener);
    }
  }

  void removeListenersByEventType<T>() {
    final String key = T.toString();
    _listenersMap.remove(key);
  }

  void dispatch(Event event) {
    final String eventKey = event.runtimeType.toString();
    final bool existsEventType =  _listenersMap.containsKey(eventKey);

    if(!existsEventType) {
      return;
    }

    _listenersMap[eventKey]!.exec(event);
  }
}