part of 'example_bloc.dart';

///
/// Initial State
///
@immutable
class ExampleState with EquatableMixin {
  ///
  final List<RedBox>? redBoxes;

  ///
  final List<GreenBox>? greenBoxes;

  ///
  const ExampleState({required this.redBoxes, required this.greenBoxes});

  ///
  ExampleState.initial()
      : redBoxes = List<RedBox>.generate(20, (int index) => const RedBox()),
        greenBoxes =
            List<GreenBox>.generate(20, (int index) => const GreenBox());

  ///
  /// Better to user copyWith or freezed library
  ///
  ExampleState copyWith({List<RedBox>? rBoxes, List<GreenBox>? gBoxes}) {
    return ExampleState(
        redBoxes: rBoxes ?? redBoxes, greenBoxes: gBoxes ?? greenBoxes);
  }

  @override
  List<Object?> get props => <Object?>[redBoxes, greenBoxes];
}
