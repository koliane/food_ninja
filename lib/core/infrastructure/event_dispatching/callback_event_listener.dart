import 'event_listener.dart';
import 'event.dart';

typedef EventListenerCallback = Function(Event);

class CallbackEventListener extends EventListener {
  final EventListenerCallback _callback;
  CallbackEventListener(
      EventListenerCallback callback,
      {
        int priority = EventListener.defaultPriority,
        bool isPersistent = false
      }
  ):
    _callback = callback,
    super(
          priority: priority,
          isPersistent: isPersistent
      )
  ;

  @override
  void exec(covariant Event event) {
    _callback(event);
  }
}