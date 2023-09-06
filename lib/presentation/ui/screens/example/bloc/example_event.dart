part of 'example_bloc.dart';

///
/// Immutable!!!!!!!!!!!!!!!!!!
/// You can get lot of benefits by using immutable data
/// For More Info:
/// https://dart.academy/immutable-data-patterns-in-dart-and-flutter
/// you can understand why we used (@immutable, final variables and const constructor)
/// from the above link
///

///
@immutable
abstract class ExampleEvent with EquatableMixin {
  ///
  const ExampleEvent();
}

///
/// On Red Box Click Event
///
class RedBoxClickEvent extends ExampleEvent {
  ///
  final int index;

  ///
  const RedBoxClickEvent({required this.index});

  @override
  List<Object?> get props => <Object?>[index];
}

///
/// On Green Box Click Event
///
class GreenBoxClickEvent extends ExampleEvent {
  ///
  final int index;

  ///
  const GreenBoxClickEvent({required this.index});

  @override
  List<Object?> get props => <Object?>[index];
}

///
/// On Green Box Click Event
///
class DataPassEvent extends ExampleEvent {
  ///
  const DataPassEvent();

  @override
  List<Object?> get props => <Object?>[];
}
