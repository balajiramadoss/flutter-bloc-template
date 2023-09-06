import 'dart:async';

import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:starter/data/injection/injector.dart';

///
mixin EventMixin<T extends AppEvent> {

  ///
  EventBus get eventBus => injector<EventBus>();

  ///
  void fireEvent(T event) {
    eventBus.fire(event);
  }

  ///
  StreamSubscription<T> listenEvents(Function(T event) onEvent) =>
      eventBus.on<T>().listen(onEvent);
}
