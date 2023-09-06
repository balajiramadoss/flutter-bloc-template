import 'package:event_bus_plus/event_bus_plus.dart';

///
class ExampleEvent extends AppEvent {

  ///
  final String text;

  ///
  const ExampleEvent(this.text);

  @override
  List<Object?> get props => <Object?>[text];

}
