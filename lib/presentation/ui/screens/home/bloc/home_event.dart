part of 'home_bloc.dart';

///
@immutable
abstract class HomeEvent {
  ///
  const HomeEvent();
}

///
class InitialEvent extends HomeEvent {
  ///
  const InitialEvent();
}

///
class RefreshEvent extends HomeEvent {
  ///
  const RefreshEvent();
}

///
class UpdateBoxesCountEvent extends HomeEvent {
  ///
  final int redBoxCount;

  ///
  final int greenBoxCount;

  ///
  const UpdateBoxesCountEvent(
      {required this.redBoxCount, required this.greenBoxCount});
}
