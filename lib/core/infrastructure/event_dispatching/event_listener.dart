import 'event.dart';


abstract class EventListener {
  static const int defaultPriority = 100;
  // Чем значение выше, тем раньше применится
  final int priority;
  final bool isPersistent;
  final bool ignoreIfTypeExists;

  EventListener(
      {
        this.priority = EventListener.defaultPriority,
        this.isPersistent = false,
        this.ignoreIfTypeExists = true
      }
  );

  void exec(covariant Event event);
}