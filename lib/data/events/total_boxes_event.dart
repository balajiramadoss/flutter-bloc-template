import 'package:event_bus_plus/event_bus_plus.dart';

///
class TotalBoxesEvent extends AppEvent {
  ///
  final int redBoxesCount;

  ///
  final int greenBoxesCount;

  ///
  const TotalBoxesEvent(
      {required this.redBoxesCount, required this.greenBoxesCount});

  @override
  List<Object?> get props => <Object?>[redBoxesCount, greenBoxesCount];
}
